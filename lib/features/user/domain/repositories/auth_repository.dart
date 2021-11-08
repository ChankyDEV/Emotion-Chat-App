import 'dart:async';

import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';

abstract class AuthRepository {
  Future<ChatUser> signUpWithEmailAndPhone({
    required EmailAddress? emailAddress,
    required PhoneNumber? phoneNumber,
    required Password? password,
  });

  Future<ChatUser> signInWithEmail({
    required EmailAddress? emailAddress,
    required Password? password,
  });

  Future<ChatUser> signInWithPhoneNumber({
    required PhoneNumber? phoneNumber,
    required Password? password,
  });

  Future<ChatUser> getSignedInUser();

  Future<void> addInfoAboutUserToStream(ChatUser user);

  Stream<UserDTO> get currentUser;

  void close();
}
