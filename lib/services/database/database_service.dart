import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

abstract class DatabaseService {
  Future<void> addUser(MyUser user);

  Future<void> updateUser(MyUser user);

  Future<MyUser> getUser(String uid);

  Future<String> findUserUidByEmail(String email);

  Future<void> sendInvitation({
    required String from,
    required String to,
  });

  Stream<Invitation> get invitations;
}
