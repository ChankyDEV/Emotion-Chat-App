import 'dart:convert' as convert;
import 'dart:io';

import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/services/auth/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class MongoAuthService implements IAuthService {
  final http.Client client;

  MongoAuthService({required this.client});

  @override
  void close() {
    currentUser!.close();
  }

  @override
  Future<MyUser> signInWithEmail(
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
  Future<MyUser> signInWithPhoneNumber(
      {required PhoneNumber? phoneNumber, required Password? password}) async {
    String url = 'http://192.168.0.107:3000/auth/signInPhone';
    var credentials = {
      'phone': phoneNumber!.value,
      'password': password!.value,
    };
    return await post(url, credentials);
  }

  @override
  Future<MyUser> signUpWithEmailAndPhone(
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
  Future<MyUser> updateUserInfo(
      {required Name? name,
      required Gender? gender,
      required bool? hasOwnImage,
      required String? uid,
      required String generatedImageUploadUrl}) async {
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
  Future<MyUser> post(String url, Map<String, dynamic> json) async {
    final response = await client.post(
      Uri.parse(url),
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
  Future<MyUser> getSignedInUser() {
    return Future.value(currentUser!.value);
  }

  @override
  void addInfoAboutUserToStream(MyUser user) {
    currentUser!.add(user);
  }

  @override
  BehaviorSubject<MyUser>? currentUser = BehaviorSubject<MyUser>();
}
