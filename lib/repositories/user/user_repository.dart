import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:emotion_chat/services/auth/i_auth_service.dart';
import 'package:emotion_chat/services/image_upload/i_image_service.dart';
import 'package:emotion_chat/services/local_db/i_local_db_service.dart';
import 'package:emotion_chat/services/network/i_network_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IUserRepository)
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
  BehaviorSubject<User>? get currentUser => authService.currentUser;

  @override
  void close() {
    authService.close();
  }

  @override
  Future<User> getSignedInUser() async {
    return await authService.getSignedInUser();
  }

  @override
  Future<Either<Failure, User>> signInWithEmail(
      {required EmailAddress emailAddress, required Password password}) async {
    return await _performAuthAction(() => authService.signInWithEmail(
        emailAddress: emailAddress, password: password));
  }

  @override
  Future<Either<Failure, User>> signInWithPhoneNumber(
      {required PhoneNumber phoneNumber, required Password password}) async {
    return await _performAuthAction(() => authService.signInWithPhoneNumber(
        phoneNumber: phoneNumber, password: password));
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required EmailAddress emailAddress,
      required PhoneNumber phoneNumber,
      required Password password}) async {
    return await _performAuthAction(() => authService.signUpWithEmailAndPhone(
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        password: password));
  }

  Future<Either<Failure, User>> _performAuthAction(Function authAction) async {
    if (await networkService.isConnected) {
      try {
        final user = await authAction() as User;
        await localDatabaseService.saveUser(user);
        authService.addInfoAboutUserToStream(user);
        return right(user);
      } on AuthException catch (e) {
        return left(AuthFailure(message: e.message));
      }
    } else {
      return left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await localDatabaseService.removeUser();
      authService.addInfoAboutUserToStream(User.empty());
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
        authService.addInfoAboutUserToStream(User.empty());
        return false;
      }
    } else {
      authService.addInfoAboutUserToStream(User.empty());
      return false;
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserInfo(
      {required Name name,
      required Gender gender,
      required bool hasOwnImage,
      Image? profileImage}) async {
    if (await networkService.isConnected) {
      try {
        User user = await authService.getSignedInUser();
        String generatedImageUploadUrl = "";
        if (hasOwnImage) {
          generatedImageUploadUrl = await imageService.generateProfileImageUrl(
              profileImage: profileImage, uid: user.uid);
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
