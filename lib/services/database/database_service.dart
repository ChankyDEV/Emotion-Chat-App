import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

abstract class DatabaseService {
  Future<void> addUser(ChatUser user);

  Future<void> updateUser(ChatUser user);

  Future<ChatUser> getUser(String uid);

  Future<Stream<List<Message>>> getMessagesStreamFor(List<String> members);

  Future<void> sendMessage({
    required String from,
    required String to,
    required String message,
  });

  Future<void> sendInvitation({
    required String from,
    required String to,
  });

  Stream<List<Invitation>> getInvitationsStreamOnUid(String uid);

  Future<void> deleteInvitation(
    String userUid,
    Invitation invitation,
  );

  Future<void> acceptInvitation(
    String userUid,
    Invitation invitation,
  );

  Future<List<ChatUser>> getAllFriends(String userUid);

  Future<ChatUser> findUserByUuid(uuid);

  Future<String> findUserUuidByEmail(String email);

  Future<ChatUser> findUserByEmail(String email);
}
