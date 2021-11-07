import 'package:emotion_chat/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<ChatUser> findUserByUuid(uuid);

  Future<String> findUserUuidByEmail(String email);

  Future<ChatUser> findUserByEmail(String email);

  Future<void> addUser(ChatUser user);

  Future<void> updateUser(ChatUser user);

  Future<ChatUser> getUser(String uid);
}
