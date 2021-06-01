import 'package:emotion_chat/constants/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class IAuthService {
  Future<User> signUpWithEmailAndPhone(
      {required EmailAddress? emailAddress,
      required PhoneNumber? phoneNumber,
      required Password? password});

  Future<User> signInWithEmail(
      {required EmailAddress? emailAddress, required Password? password});

  Future<User> signInWithPhoneNumber(
      {required PhoneNumber? phoneNumber, required Password? password});
  Future<User> updateUserInfo(
      {required Name? name,
      required Gender? gender,
      required bool? hasOwnImage,
      required String? uid,
      required String? generatedImageUploadUrl});

  Future<User> getSignedInUser();
  void addInfoAboutUserToStream(User user);

  BehaviorSubject<User>? currentUser;
  void close() {
    currentUser!.close();
  }
}
