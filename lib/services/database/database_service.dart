import 'package:emotion_chat/constants/data.dart';

abstract class DatabaseService {
  Future<void> addUser(MyUser user);
  Future<void> updateUser(MyUser user);
  Future<MyUser> getUser(String uid);
}
