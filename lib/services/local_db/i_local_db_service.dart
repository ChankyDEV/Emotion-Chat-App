import 'package:emotion_chat/constants/data.dart';

abstract class ILocalDatabaseService {
  Future<void> saveUser(User user);
  Future<User> getUser();
  Future<bool> isUserSaved();
  Future<void> removeUser();
}
