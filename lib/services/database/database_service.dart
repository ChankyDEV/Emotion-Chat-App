import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

abstract class DatabaseService {
  Future<void> addUser(MyUser user);

  Future<void> updateUser(MyUser user);

  Future<MyUser> getUser(String uid);

  Future<String> findUserUidByEmail(String email);

  Future<MyUser> findUserByEmail(String email);

  Future<void> sendInvitation({
    required String from,
    required String to,
  });

  Stream<List<Invitation>> getInvitationsStreamOnUid(String uid);

  Future<void> deleteInvitation(
    String userUid,
    String invitationUid,
  );

  Future<void> acceptInvitation(
    String userUid,
    String invitationUid,
  );
}
