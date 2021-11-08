import 'package:emotion_chat/features/user/domain/entities/user.dart';

abstract class LocalRepository {
  Future<void> saveUser(ChatUser user);
  Future<ChatUser> getUser();
  Future<bool> isUserSaved();
  Future<void> removeUser();
}
