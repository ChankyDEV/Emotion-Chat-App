import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/features/user/domain/repositories/auth_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/features/user/domain/services/auth_service.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:emotion_chat/utils/data/utils/failures.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

class UserServiceImpl implements AuthService {
  final ImageRepository imageRepository;
  final AuthRepository authRepository;
  final LocalRepository localRepository;
  final NetworkInfo networkInfo;
  final UserRepository userRepository;

  UserServiceImpl({
    required this.imageRepository,
    required this.authRepository,
    required this.localRepository,
    required this.networkInfo,
    required this.userRepository,
  });

  @override
  Stream<ChatUser> get currentUser => authRepository.currentUser.map(
        (dto) => dto.toDomain(),
      );

  @override
  Future<ChatUser> getSignedInUser() async {
    return await localRepository.getUser();
  }

  @override
  Future<Either<Failure, ChatUser>> signInWithEmail({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    return await _performAuthAction(
      () => authRepository.signInWithEmail(
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
      () => authRepository.signInWithPhoneNumber(
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
      () => authRepository.signUpWithEmailAndPhone(
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
    if (await networkInfo.isConnected) {
      try {
        final user = await authAction() as ChatUser;
        if (isSignUpAction) {
          await userRepository.addUser(user);
        }
        await localRepository.saveUser(user);
        await authRepository.addInfoAboutUserToStream(user);
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
      await localRepository.removeUser();
      authRepository.addInfoAboutUserToStream(ChatUser.empty());
      return true;
    } on AuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  @override
  Future<bool> checkIfUserIsLoggedIn() async {
    bool isUserSaved = await localRepository.isUserSaved();
    if (isUserSaved) {
      try {
        final user = await localRepository.getUser();
        authRepository.addInfoAboutUserToStream(user);
        return true;
      } on AuthException catch (e) {
        print(e);
        authRepository.addInfoAboutUserToStream(ChatUser.empty());
        return false;
      }
    } else {
      authRepository.addInfoAboutUserToStream(ChatUser.empty());
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
    if (await networkInfo.isConnected) {
      try {
        ChatUser user = await authRepository.getSignedInUser();
        String generatedImageUploadUrl = "";
        if (hasOwnImage) {
          await imageRepository.uploadProfileImage(
              profileImage: profileImage, uid: user.uuid);
          generatedImageUploadUrl =
              await imageRepository.getProfileImageUrl(uid: user.uuid);
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
        await userRepository.updateUser(updatedUser);
        await localRepository.saveUser(updatedUser);
        authRepository.addInfoAboutUserToStream(updatedUser);
        return right(unit);
      } on AuthException catch (e) {
        return left(AuthFailure(message: e.message));
      }
    } else {
      return left(NetworkFailure(message: 'User has not network connection'));
    }
  }
}
