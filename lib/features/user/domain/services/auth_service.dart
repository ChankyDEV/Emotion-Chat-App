import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

abstract class AuthService {
  Stream<ChatUser> get currentUser;

  Future<Either<Failure, ChatUser>> signUp({
    required EmailAddress emailAddress,
    required PhoneNumber phoneNumber,
    required Password password,
  });

  Future<Either<Failure, ChatUser>> signInWithEmail({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<Failure, ChatUser>> signInWithPhoneNumber({
    required PhoneNumber phoneNumber,
    required Password password,
  });

  Future<Either<Failure, Unit>> updateUserInfo({
    required Name name,
    required Gender gender,
    required bool hasOwnImage,
    MyPickedFile? profileImage,
  });

  Future<ChatUser> getSignedInUser();

  Future<bool> logout();

  Future<bool> checkIfUserIsLoggedIn();
}
