import 'dart:async';

import 'package:emotion_chat/constants/data.dart';

abstract class AuthService {
  Future<MyUser> signUpWithEmailAndPhone(
      {required EmailAddress? emailAddress,
      required PhoneNumber? phoneNumber,
      required Password? password});

  Future<MyUser> signInWithEmail(
      {required EmailAddress? emailAddress, required Password? password});

  Future<MyUser> signInWithPhoneNumber(
      {required PhoneNumber? phoneNumber, required Password? password});

  Future<MyUser> getSignedInUser();

  Future<void> addInfoAboutUserToStream(MyUser user);

  StreamController<MyUser> get currentUser;

  void close();
}
