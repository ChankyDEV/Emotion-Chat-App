import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/image/domain/services/image_service.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/user/domain/repositories/auth_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/features/user/domain/services/auth_service.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class UserServiceImpl implements AuthService {
  final ImageService imageService;
  final AuthRepository authService;
  final LocalRepository localDatabaseService;
  final NetworkInfo networkService;
  final DatabaseService db;

  UserServiceImpl({
    required this.imageService,
    required this.authService,
    required this.localDatabaseService,
    required this.networkService,
    required this.db,
  });

  @override
  Stream<ChatUser> get currentUser => authService.currentUser.map(
        (dto) => dto.toDomain(),
      );

  @override
  Future<ChatUser> getSignedInUser() async {
    return await localDatabaseService.getUser();
  }

  @override
  Future<Either<Failure, ChatUser>> signInWithEmail({
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
  Future<Either<Failure, ChatUser>> signInWithPhoneNumber({
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
  Future<Either<Failure, ChatUser>> signUp(
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

  Future<Either<Failure, ChatUser>> _performAuthAction(
    Function authAction,
    bool isSignUpAction,
  ) async {
    if (await networkService.isConnected) {
      try {
        final user = await authAction() as ChatUser;
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
      authService.addInfoAboutUserToStream(ChatUser.empty());
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
        authService.addInfoAboutUserToStream(ChatUser.empty());
        return false;
      }
    } else {
      authService.addInfoAboutUserToStream(ChatUser.empty());
      return false;
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserInfo({
    required Name name,
    required Gender gender,
    required bool hasOwnImage,
    MyPickedFile? profileImage,
  }) async {
    if (await networkService.isConnected) {
      try {
        ChatUser user = await authService.getSignedInUser();
        String generatedImageUploadUrl = "";
        if (hasOwnImage) {
          await imageService.uploadProfileImage(
              profileImage: profileImage, uid: user.uuid);
          generatedImageUploadUrl =
              await imageService.getProfileImageUrl(uid: user.uuid);
        }
        final updatedUser = ChatUser(
          phoneNumber: user.phoneNumber,
          emailAddress: user.emailAddress,
          name: name,
          hasOwnImage: hasOwnImage,
          gender: gender,
          profileImage: ProfileImage(url: generatedImageUploadUrl),
          uuid: user.uuid,
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
