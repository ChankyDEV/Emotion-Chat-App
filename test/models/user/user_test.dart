import 'dart:convert';
import 'dart:convert' as convert;

import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/domain/entities/gender_enum.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const email = EmailAddress(value: 'KamilKoczan@wp.pl');
  const phone = PhoneNumber(value: '796262965');
  const gender = Gender(value: GenderEnum.male);
  const name = Name(value: 'Kamil');
  final user = ChatUser(
    uuid: '12345',
    emailAddress: email,
    phoneNumber: phone,
    profileImage: ProfileImage(url: 'http://12345.pl'),
    gender: gender,
    hasOwnImage: false,
    name: name,
  );
  final userDTO = UserDTO(
    uid: '12345',
    emailAddress: email.value,
    phoneNumber: phone.value,
    profileImageUrl: 'http://12345.pl',
    gender: 'GenderEnum.male',
    hasOwnImage: false,
    name: 'Kamil',
  );

  group('fromJson', () {
    test('should return User from json format', () {
      Map<String, dynamic> json = convert.jsonDecode(fixture('user.json'));
      final result = UserDTO.fromJson(json);
      expect(result, userDTO);
    });
  });

  group('toJson', () {
    test('should return json from user', () {
      final result = userDTO.toJson();
      final expectedJson = json.decode(fixture('user.json'));
      expect(result, expectedJson);
    });
  });

  group('User model', () {
    test('should can convert to userDTO', () {
      final result = user.fromDomain();
      expect(result, userDTO);
    });

    test('should can be created from userDTO', () {
      final result = userDTO.toDomain();
      expect(result, user);
    });
  });
}
