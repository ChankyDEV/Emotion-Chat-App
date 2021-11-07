import 'dart:async';

import 'package:emotion_chat/constants/data.dart';

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
