import 'dart:io';

import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/services/auth/mongo_auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../fixtures/fixture_reader.dart';
import 'auth_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const emailAddress = EmailAddress(value: 'KamilKoczan@wp.pl');
  const phoneNumber = PhoneNumber(value: '796262965');
  const password = Password(value: '12345');
  late MockClient client;
  late MongoAuthService service;

  setUp(() {
    client = MockClient();
    service = MongoAuthService(client: client);
  });

  void setUpSuccessResponse() {
    when(client.post(any,
            headers: anyNamed('headers'),
            body: anyNamed('body'),
            encoding: anyNamed('encoding')))
        .thenAnswer(
            (_) async => http.Response(fixture('userResponse.json'), 200));
  }

  void setUpFailResponse() {
    when(client.post(any,
            headers: anyNamed('headers'),
            body: anyNamed('body'),
            encoding: anyNamed('encoding')))
        .thenAnswer(
            (_) async => http.Response(fixture('failResponse.json'), 404));
  }

  group('should perform post request on', () {
    test('signUp url', () async {
      setUpSuccessResponse();
      await service.signUpWithEmailAndPhone(
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          password: password);

      verify(
        client.post(
          Uri(path: 'http://192.168.0.107:3000/auth/signUp'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: fixture('userToSignUp.json'),
          encoding: null,
        ),
      );
    });
    test('signInEmail url', () async {
      setUpSuccessResponse();
      await service.signInWithEmail(
          emailAddress: emailAddress, password: password);

      verify(
        client.post(
          Uri(path: 'http://192.168.0.107:3000/auth/signInEmail'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: fixture('email_credentials.json'),
          encoding: null,
        ),
      );
    });
    test('signInPhone url', () async {
      setUpSuccessResponse();
      await service.signInWithPhoneNumber(
          phoneNumber: phoneNumber, password: password);

      verify(
        client.post(
          Uri(path: 'http://192.168.0.107:3000/auth/signInPhone'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: fixture('phone_credentials.json'),
          encoding: null,
        ),
      );
    });
    final tname = Name(value: 'kamil');
    final tgender = Gender(value: GenderEnum.male);
    final thasOwnImage = false;
    test('updateUserInfo url', () async {
      when(client.post(any,
              headers: anyNamed('headers'),
              body: anyNamed('body'),
              encoding: anyNamed('encoding')))
          .thenAnswer((_) async =>
              http.Response(fixture('user_filled_response.json'), 200));
      await service.updateUserInfo(
        name: tname,
        gender: tgender,
        hasOwnImage: thasOwnImage,
        generatedImageUploadUrl: '12345',
        uid: '12345',
      );

      verify(
        client.post(
          Uri(path: 'http://192.168.0.107:3000/auth/updateUserInfo'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: fixture('updated_user_info.json'),
          encoding: null,
        ),
      );
    });
  });

  final tuser = User(
      uid: '12345',
      profileImage: ProfileImage(url: '12345'),
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      name: Name(value: ''),
      gender: Gender(value: GenderEnum.none),
      hasOwnImage: false,
      contactsUIDS: ['empty']);
  group('SignUp', () {
    test('should return user when request wentWell', () async {
      setUpSuccessResponse();
      final result = await service.signUpWithEmailAndPhone(
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          password: password);
      expect(result, tuser);
    });
    test('should throw AuthException when request fail', () async {
      setUpFailResponse();
      final call = service.signUpWithEmailAndPhone;
      expect(
          () async => call(
              emailAddress: emailAddress,
              phoneNumber: phoneNumber,
              password: password),
          throwsA(
              predicate((e) => e is AuthException && e.message == 'error')));
    });
  });

  group('SignInEmail', () {
    test('should return user when request wentWell', () async {
      setUpSuccessResponse();
      final result = await service.signInWithEmail(
          emailAddress: emailAddress, password: password);
      expect(result, tuser);
    });
    test('should throw AuthException when request fail', () async {
      setUpFailResponse();
      final call = service.signInWithEmail;
      ;
      expect(
          () async => call(emailAddress: emailAddress, password: password),
          throwsA(
              predicate((e) => e is AuthException && e.message == 'error')));
    });
  });

  group('SignInPhone', () {
    test('should return user when request wentWell', () async {
      setUpSuccessResponse();
      final result = await service.signInWithPhoneNumber(
          phoneNumber: phoneNumber, password: password);
      expect(result, tuser);
    });
    test('should throw AuthException when request fail', () async {
      setUpFailResponse();
      final call = service.signInWithPhoneNumber;
      expect(
          () async => call(phoneNumber: phoneNumber, password: password),
          throwsA(
              predicate((e) => e is AuthException && e.message == 'error')));
    });
  });

  group('updateUserInfo', () {
    final tname = Name(value: 'kamil');
    final tgender = Gender(value: GenderEnum.male);
    final thasOwnImage = false;
    final testUser = User(
      name: tname,
      gender: tgender,
      profileImage: ProfileImage(url: '12345'),
      hasOwnImage: thasOwnImage,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      contactsUIDS: ['empty'],
      uid: '12345',
    );
    test('should return user when request wentWell', () async {
      when(client.post(any,
              headers: anyNamed('headers'),
              body: anyNamed('body'),
              encoding: anyNamed('encoding')))
          .thenAnswer((_) async =>
              http.Response(fixture('user_filled_response.json'), 200));
      final result = await service.updateUserInfo(
          name: tname,
          gender: tgender,
          hasOwnImage: thasOwnImage,
          generatedImageUploadUrl: "12345",
          uid: "12345");
      expect(result, testUser);
    });
    test('should throw AuthException when request fail', () async {
      setUpFailResponse();
      final call = service.updateUserInfo;

      expect(
          () async => service.updateUserInfo(
              name: tname,
              gender: tgender,
              hasOwnImage: thasOwnImage,
              generatedImageUploadUrl: '',
              uid: ''),
          throwsA(
              predicate((e) => e is AuthException && e.message == 'error')));
    });
  });
}
