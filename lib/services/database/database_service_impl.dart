import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<void> addUser(MyUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant add user',
      );

  @override
  Future<MyUser> getUser(String uid) async {
    try {
      final response = await _db.collection('users').doc(uid).get();
      return UserDTO.fromJson(response.data()).toDomain();
    } catch (e) {
      throw AuthException(message: 'Cant get user');
    }
  }

  @override
  Future<void> updateUser(MyUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant update user',
      );

  Future<void> _addOrUpdateUser(
    MyUser user, {
    String onErrorMessage = '',
  }) async {
    try {
      await _db
          .collection('users')
          .doc(user.uid)
          .set(user.fromDomain().toJson());
    } catch (e) {
      throw AuthException(message: onErrorMessage);
    }
  }

  @override
  Future<String> findUserUidByEmail(String email) {
    return Future.value('12345');
  }

  @override
  Future<void> sendInvitation({
    required String from,
    required String to,
  }) async {}

  @override
  Stream<Invitation> get invitations async* {
    // yield* _db
    //     .collection('invitations')
    //     .doc('uid')
    //     .collection('invites')
    //     .snapshots()
    //     .map((inv) => Invitation.fromJson(
    //           inv.docChanges.first.doc.data(),
    //         ));
  }
}
