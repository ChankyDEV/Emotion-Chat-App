import 'package:emotion_chat/constants/data.dart';

abstract class LocalDatabaseService {
  Future<void> saveUser(MyUser user);
  Future<MyUser> getUser();
  Future<bool> isUserSaved();
  Future<void> removeUser();
}