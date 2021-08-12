import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class IUserRepository {
  BehaviorSubject<MyUser>? get currentUser;
  Future<Either<Failure, MyUser>> signUp(
      {required EmailAddress emailAddress,
      required PhoneNumber phoneNumber,
      required Password password});

  Future<Either<Failure, MyUser>> signInWithEmail(
      {required EmailAddress emailAddress, required Password password});

  Future<Either<Failure, MyUser>> signInWithPhoneNumber(
      {required PhoneNumber phoneNumber, required Password password});

  Future<Either<Failure, Unit>> updateUserInfo(
      {required Name name,
      required Gender gender,
      required bool hasOwnImage,
      Image? profileImage});

  Future<MyUser> getSignedInUser();

  Future<bool> logout();
  Future<bool> checkIfUserIsLoggedIn();
  void close() {
    currentUser!.close();
  }
}
