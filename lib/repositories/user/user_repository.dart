import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:emotion_chat/services/auth/i_auth_service.dart';
import 'package:emotion_chat/services/image_upload/i_image_service.dart';
import 'package:emotion_chat/services/local_db/i_local_db_service.dart';
import 'package:emotion_chat/services/network/i_network_service.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository implements IUserRepository {
  final IImageUploadService imageService;
  final IAuthService authService;
  final ILocalDatabaseService localDatabaseService;
  final INetworkService networkService;

  UserRepository({
    required this.imageService,
    required this.authService,
    required this.localDatabaseService,
    required this.networkService,
  });

  @override
  BehaviorSubject<MyUser>? get currentUser => authService.currentUser;

  @override
  void close() {
    authService.close();
  }

  @override
  Future<MyUser> getSignedInUser() async {
    return await authService.getSignedInUser();
  }

  @override
  Future<Either<Failure, MyUser>> signInWithEmail(
      {required EmailAddress emailAddress, required Password password}) async {
    return await _performAuthAction(() => authService.signInWithEmail(
        emailAddress: emailAddress, password: password));
  }

  @override
  Future<Either<Failure, MyUser>> signInWithPhoneNumber(
      {required PhoneNumber phoneNumber, required Password password}) async {
    return await _performAuthAction(() => authService.signInWithPhoneNumber(
        phoneNumber: phoneNumber, password: password));
  }

  @override
  Future<Either<Failure, MyUser>> signUp(
      {required EmailAddress emailAddress,
      required PhoneNumber phoneNumber,
      required Password password}) async {
    return await _performAuthAction(() => authService.signUpWithEmailAndPhone(
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        password: password));
  }

  Future<Either<Failure, MyUser>> _performAuthAction(
      Function authAction) async {
    if (await networkService.isConnected) {
      try {
        final user = await authAction() as MyUser;
        await localDatabaseService.saveUser(user);
        authService.addInfoAboutUserToStream(user);
        return right(user);
      } on AuthException catch (e) {
        return left(AuthFailure(message: e.message));
      } on SocketException catch (e) {
        return left(AuthFailure(message: 'Server error, we are sorry'));
      }
    } else {
      return left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await localDatabaseService.removeUser();
      authService.addInfoAboutUserToStream(MyUser.empty());
      return true;
    } on AuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  @override
  Future<bool> checkIfUserIsLoggedIn() async {
    bool isUserSaved = await localDatabaseService.isUserSaved();
    if (isUserSaved) {
      try {
        final user = await localDatabaseService.getUser();
        authService.addInfoAboutUserToStream(user);
        return true;
      } on AuthException catch (e) {
        print(e);
        authService.addInfoAboutUserToStream(MyUser.empty());
        return false;
      }
    } else {
      authService.addInfoAboutUserToStream(MyUser.empty());
      return false;
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserInfo(
      {required Name name,
      required Gender gender,
      required bool hasOwnImage,
      MyPickedFile? profileImage}) async {
    if (await networkService.isConnected) {
      try {
        MyUser user = await authService.getSignedInUser();
        String generatedImageUploadUrl = "";
        if (hasOwnImage) {
          await imageService.uploadProfileImage(
              profileImage: profileImage, uid: user.uid);
          generatedImageUploadUrl =
              await imageService.getProfileImageUrl(uid: user.uid);
        }
        user = await authService.updateUserInfo(
            name: name,
            gender: gender,
            hasOwnImage: hasOwnImage,
            uid: user.uid,
            generatedImageUploadUrl: generatedImageUploadUrl);

        await localDatabaseService.saveUser(user);
        authService.addInfoAboutUserToStream(user);
        return right(unit);
      } on AuthException catch (e) {
        return left(AuthFailure(message: e.message));
      }
    } else {
      return left(NetworkFailure(message: 'User has not network connection'));
    }
  }
}
