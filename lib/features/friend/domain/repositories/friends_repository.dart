import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';

abstract class FriendsRepository {
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
