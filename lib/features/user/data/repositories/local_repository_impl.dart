import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocalRepositoryImpl implements LocalRepository {
  @override
  Future<ChatUser> getUser() async {
    final userBox = await openOrGetBox('user');
    final userDto = await performActionOnLocalUser<UserDTO>(
        () => userBox.get('user'), userBox);

    return userDto.toDomain();
  }

  @override
  Future<void> saveUser(ChatUser user) async {
    final userBox = await openOrGetBox('user');
    final result = await performActionOnLocalUser<void>(
        () => userBox.put('user', user.fromDomain()), userBox);
    return result;
  }

  @override
  Future<void> removeUser() async {
    final userBox = await openOrGetBox('user');
    await performActionOnLocalUser<int>(() => userBox.clear(), userBox);
  }

  @override
  Future<bool> isUserSaved() async {
    final userBox = await openOrGetBox('user');
    try {
      return userBox.isNotEmpty ? true : false;
    } catch (e) {
      return false;
    }
  }

  @visibleForTesting
  Future<Box<dynamic>> openOrGetBox(String boxName) async {
    return Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);
  }

  @visibleForTesting
  Future<T> performActionOnLocalUser<T>(
      Function actionOnLocalUser, Box<dynamic> box) async {
    try {
      return await actionOnLocalUser();
    } catch (e) {
      throw AuthException(
          message: 'Failed while trying to perform action on user');
    }
  }
}
