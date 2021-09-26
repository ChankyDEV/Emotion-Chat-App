import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/data/models/invitation/invitation_dto.dart';
import 'package:emotion_chat/services/database/database_service.dart';

mixin Collections {
  static const users = 'users';
  static const invitations = 'invitations';
  static const invites = 'invites';
  static const conversations = 'conversations';
  static const contacts = 'contacts';
  static const friends = 'friends';
}

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
      final response = await _db.collection(Collections.users).doc(uid).get();
      return UserDTO.fromJson(response.data()).toDomain();
    } catch (e) {
      throw AuthException(message: 'Cant get user');
    }
  }

  @override
  Future<void> updateUser(MyUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant update user',
        isFirstTime: false,
      );

  Future<void> _addOrUpdateUser(
    MyUser user, {
    String onErrorMessage = '',
    bool isFirstTime = true,
  }) async {
    try {
      await _db
          .collection(Collections.users)
          .doc(user.uid)
          .set(user.fromDomain().toJson());
      if (isFirstTime) {
        await _db
            .collection(Collections.invitations)
            .doc(user.uid)
            .collection(Collections.invites)
            .add(
              Invitation.empty().toJson(),
            );
      }
    } catch (e) {
      throw AuthException(message: onErrorMessage);
    }
  }

  @override
  Future<String> findUserUidByEmail(String email) async {
    final user = await _findUserByEmail(email);
    return user.uid;
  }

  @override
  Future<MyUser> findUserByEmail(String email) {
    return _findUserByEmail(email);
  }

  Future<MyUser> _findUserByEmail(String email) async {
    try {
      final response = await _db
          .collection(Collections.users)
          .where('email', isEqualTo: email)
          .get();
      return UserDTO.fromJson(response.docs.first.data()).toDomain();
    } catch (e) {
      throw DatabaseException(message: 'Cant get user uid with this email');
    }
  }

  @override
  Future<void> sendInvitation({
    required String from,
    required String to,
  }) async {
    await _db
        .collection(Collections.invitations)
        .doc(to)
        .collection(Collections.invites)
        .add(
          InvitationDTO(DateTime.now(), from).toJson(),
        );
  }

  @override
  Stream<List<Invitation>> getInvitationsStreamOnUid(String uid) {
    return _db
        .collection('invitations')
        .doc(uid)
        .collection('invites')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (event) => _mapDocToInvitation(event.docs),
        );
  }

  List<Invitation> _mapDocToInvitation(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> data,
  ) {
    final invitations = <Invitation>[];

    data.forEach((element) {
      final json = element.data();
      String uid = element.id;
      DateTime createdAt = (json['createdAt'] as Timestamp).toDate();
      String senderUid = json['senderUid'];
      invitations.add(
        Invitation.withUid(uid, createdAt, senderUid),
      );
    });
    return invitations;
  }

  Future<void> deleteInvitation(
    String userUid,
    String invitationUid,
  ) async {
    try {
      await _db
          .collection(Collections.invitations)
          .doc(userUid)
          .collection(Collections.invites)
          .doc(invitationUid)
          .delete();
    } catch (e) {
      throw DatabaseException(message: 'Cant delete invitation');
    }
  }

  @override
  Future<void> acceptInvitation(
    String userUid,
    String invitationSenderUid,
  ) async {
    try {
      await _db
          .collection(Collections.contacts)
          .doc(userUid)
          .collection(Collections.friends)
          .add(
            InvitationDTO(DateTime.now(), invitationSenderUid).toJson(),
          );
    } catch (e) {
      throw DatabaseException(message: 'Cant accept invitation');
    }
  }
}
