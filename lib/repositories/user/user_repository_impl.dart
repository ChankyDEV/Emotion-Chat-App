import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/user/user_repository.dart';
import 'package:emotion_chat/services/auth/auth_service.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:emotion_chat/services/image_upload/image_upload_service.dart';
import 'package:emotion_chat/services/local_db/local_database_service.dart';
import 'package:emotion_chat/services/network/network_service.dart';

class UserRepositoryImpl implements UserRepository {
  final ImageUploadService imageService;
  final AuthService authService;
  final LocalDatabaseService localDatabaseService;
  final NetworkService networkService;
  final DatabaseService db;

  UserRepositoryImpl(
      {required this.imageService,
      required this.authService,
      required this.localDatabaseService,
      required this.networkService,
      required this.db});

  @override
  Stream<MyUser> get currentUser => authService.currentUser.stream;

  @override
  Future<MyUser> getSignedInUser() async {
    return await localDatabaseService.getUser();
  }

  @override
  Future<Either<Failure, MyUser>> signInWithEmail({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    return await _performAuthAction(
      () => authService.signInWithEmail(
        emailAddress: emailAddress,
        password: password,
      ),
      false,
    );
  }

  @override
  Future<Either<Failure, MyUser>> signInWithPhoneNumber({
    required PhoneNumber phoneNumber,
    required Password password,
  }) async {
    return await _performAuthAction(
      () => authService.signInWithPhoneNumber(
        phoneNumber: phoneNumber,
        password: password,
      ),
      false,
    );
  }

  @override
  Future<Either<Failure, MyUser>> signUp(
      {required EmailAddress emailAddress,
      required PhoneNumber phoneNumber,
      required Password password}) async {
    return await _performAuthAction(
      () => authService.signUpWithEmailAndPhone(
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          password: password),
      true,
    );
  }

  Future<Either<Failure, MyUser>> _performAuthAction(
    Function authAction,
    bool isSignUpAction,
  ) async {
    if (await networkService.isConnected) {
      try {
        final user = await authAction() as MyUser;
        if (isSignUpAction) {
          await db.addUser(user);
        }
        await localDatabaseService.saveUser(user);
        await authService.addInfoAboutUserToStream(user);
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
        final updatedUser = MyUser(
          phoneNumber: user.phoneNumber,
          emailAddress: user.emailAddress,
          name: name,
          hasOwnImage: hasOwnImage,
          gender: gender,
          profileImage: ProfileImage(url: generatedImageUploadUrl),
          contactsUIDS: user.contactsUIDS,
          uid: user.uid,
        );
        await db.updateUser(updatedUser);
        await localDatabaseService.saveUser(updatedUser);
        authService.addInfoAboutUserToStream(updatedUser);
        return right(unit);
      } on AuthException catch (e) {
        return left(AuthFailure(message: e.message));
      }
    } else {
      return left(NetworkFailure(message: 'User has not network connection'));
    }
  }
}
