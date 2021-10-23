import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

abstract class FriendsDatabase {
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

  Future<List<ChatUser>> getAllFriends(
    String userUid, {
    required Function onFindUser,
  });
}
