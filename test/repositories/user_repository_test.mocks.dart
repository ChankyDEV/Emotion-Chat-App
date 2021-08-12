// Mocks generated by Mockito 5.0.9 from annotations
// in emotion_chat/test/repositories/user_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:emotion_chat/data/enums/connection_status.dart' as _i11;
import 'package:emotion_chat/data/models/auth/user.dart' as _i2;
import 'package:emotion_chat/data/models/auth/user_props.dart' as _i6;
import 'package:emotion_chat/services/auth/i_auth_service.dart' as _i3;
import 'package:emotion_chat/services/image_upload/i_image_service.dart' as _i7;
import 'package:emotion_chat/services/local_db/i_local_db_service.dart' as _i9;
import 'package:emotion_chat/services/network/i_network_service.dart' as _i10;
import 'package:flutter/src/widgets/image.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/src/subjects/behavior_subject.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMyUser extends _i1.Fake implements _i2.MyUser {}

/// A class which mocks [IAuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthService extends _i1.Mock implements _i3.IAuthService {
  MockIAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set currentUser(_i4.BehaviorSubject<_i2.MyUser>? _currentUser) =>
      super.noSuchMethod(Invocation.setter(#currentUser, _currentUser),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i2.MyUser> signUpWithEmailAndPhone(
          {_i6.EmailAddress? emailAddress,
          _i6.PhoneNumber? phoneNumber,
          _i6.Password? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signUpWithEmailAndPhone, [], {
                #emailAddress: emailAddress,
                #phoneNumber: phoneNumber,
                #password: password
              }),
              returnValue: Future<_i2.MyUser>.value(_FakeMyUser()))
          as _i5.Future<_i2.MyUser>);
  @override
  _i5.Future<_i2.MyUser> signInWithEmail(
          {_i6.EmailAddress? emailAddress, _i6.Password? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmail, [],
                  {#emailAddress: emailAddress, #password: password}),
              returnValue: Future<_i2.MyUser>.value(_FakeMyUser()))
          as _i5.Future<_i2.MyUser>);
  @override
  _i5.Future<_i2.MyUser> signInWithPhoneNumber(
          {_i6.PhoneNumber? phoneNumber, _i6.Password? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithPhoneNumber, [],
                  {#phoneNumber: phoneNumber, #password: password}),
              returnValue: Future<_i2.MyUser>.value(_FakeMyUser()))
          as _i5.Future<_i2.MyUser>);
  @override
  _i5.Future<_i2.MyUser> updateUserInfo(
          {_i6.Name? name,
          _i6.Gender? gender,
          bool? hasOwnImage,
          String? uid,
          String? generatedImageUploadUrl}) =>
      (super.noSuchMethod(
              Invocation.method(#updateUserInfo, [], {
                #name: name,
                #gender: gender,
                #hasOwnImage: hasOwnImage,
                #uid: uid,
                #generatedImageUploadUrl: generatedImageUploadUrl
              }),
              returnValue: Future<_i2.MyUser>.value(_FakeMyUser()))
          as _i5.Future<_i2.MyUser>);
  @override
  _i5.Future<_i2.MyUser> getSignedInUser() =>
      (super.noSuchMethod(Invocation.method(#getSignedInUser, []),
              returnValue: Future<_i2.MyUser>.value(_FakeMyUser()))
          as _i5.Future<_i2.MyUser>);
  @override
  void addInfoAboutUserToStream(_i2.MyUser? user) =>
      super.noSuchMethod(Invocation.method(#addInfoAboutUserToStream, [user]),
          returnValueForMissingStub: null);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [IImageUploadService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIImageUploadService extends _i1.Mock
    implements _i7.IImageUploadService {
  MockIImageUploadService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> generateProfileImageUrl(
          {_i8.Image? profileImage, String? uid}) =>
      (super.noSuchMethod(
          Invocation.method(#generateProfileImageUrl, [],
              {#profileImage: profileImage, #uid: uid}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
}

/// A class which mocks [ILocalDatabaseService].
///
/// See the documentation for Mockito's code generation for more information.
class MockILocalDatabaseService extends _i1.Mock
    implements _i9.ILocalDatabaseService {
  MockILocalDatabaseService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> saveUser(_i2.MyUser? user) =>
      (super.noSuchMethod(Invocation.method(#saveUser, [user]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i2.MyUser> getUser() =>
      (super.noSuchMethod(Invocation.method(#getUser, []),
              returnValue: Future<_i2.MyUser>.value(_FakeMyUser()))
          as _i5.Future<_i2.MyUser>);
  @override
  _i5.Future<bool> isUserSaved() =>
      (super.noSuchMethod(Invocation.method(#isUserSaved, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<void> removeUser() =>
      (super.noSuchMethod(Invocation.method(#removeUser, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
}

/// A class which mocks [INetworkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkService extends _i1.Mock implements _i10.INetworkService {
  MockINetworkService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Stream<_i11.ConnectionStatus> get onNetworkStatusChange =>
      (super.noSuchMethod(Invocation.getter(#onNetworkStatusChange),
              returnValue: Stream<_i11.ConnectionStatus>.empty())
          as _i5.Stream<_i11.ConnectionStatus>);
}
