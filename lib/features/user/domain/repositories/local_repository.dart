import 'package:emotion_chat/constants/data.dart';

abstract class LocalRepository {
  Future<void> saveUser(ChatUser user);
  Future<ChatUser> getUser();
  Future<bool> isUserSaved();
  Future<void> removeUser();
}
