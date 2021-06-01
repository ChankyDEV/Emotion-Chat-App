import 'dart:io';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/services/auth/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IAuthService)
class MongoAuthService implements IAuthService {
  final http.Client client;

  MongoAuthService({required this.client});

  @override
  void close() {
    currentUser!.close();
  }

  @override
  Future<User> signInWithEmail(
      {required EmailAddress? emailAddress,
      required Password? password}) async {
    String url = 'http://192.168.0.107:3000/auth/signInEmail';
    var credentials = {
      'email': emailAddress!.value,
      'password': password!.value,
    };
    return await post(url, credentials);
  }

  @override
  Future<User> signInWithPhoneNumber(
      {required PhoneNumber? phoneNumber, required Password? password}) async {
    String url = 'http://192.168.0.107:3000/auth/signInPhone';
    var credentials = {
      'phone': phoneNumber!.value,
      'password': password!.value,
    };
    return await post(url, credentials);
  }

  @override
  Future<User> signUpWithEmailAndPhone(
      {required EmailAddress? emailAddress,
      required PhoneNumber? phoneNumber,
      required Password? password}) async {
    String url = 'http://192.168.0.107:3000/auth/signUp';

    var credentials = {
      'email': emailAddress!.value,
      'phone': phoneNumber!.value,
      'password': password!.value,
    };

    return post(url, credentials);
  }

  @override
  Future<User> updateUserInfo(
      {required Name? name,
      required Gender? gender,
      required bool? hasOwnImage,
      required String? uid,
      required String? generatedImageUploadUrl}) async {
    final json = {
      'uid': uid,
      'profileImageUrl': generatedImageUploadUrl,
      'name': name!.value,
      'gender': gender.toString(),
      'hasOwnImage': hasOwnImage
    };
    return post('http://192.168.0.107:3000/auth/updateUserInfo', json);
  }

  @visibleForTesting
  Future<User> post(String url, Map<String, dynamic> json) async {
    final response = await client.post(
      Uri(path: url),
      body: convert.jsonEncode(json),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map<String, dynamic> result = convert.jsonDecode(response.body);
    bool wentWell = result['wentWell'];

    if (wentWell) {
      return UserDTO.fromJson(result['responseBody']).toDomain();
    } else {
      throw AuthException(message: messageFromMap(result['responseBody']));
    }
  }

  String messageFromMap(Map<String, dynamic> map) {
    return map['message'];
  }

  @override
  Future<User> getSignedInUser() {
    return Future.value(currentUser!.value);
  }

  @override
  void addInfoAboutUserToStream(User user) {
    currentUser!.add(user);
  }

  @override
  BehaviorSubject<User>? currentUser = BehaviorSubject<User>();
}
