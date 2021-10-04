import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/data/exceptions/error_messages.dart';
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
  Future<void> addUser(ChatUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant add user',
      );

  @override
  Future<ChatUser> getUser(String uid) async {
    try {
      final response = await _db.collection(Collections.users).doc(uid).get();
      return UserDTO.fromJson(response.data()).toDomain();
    } catch (e) {
      throw AuthException(message: 'Cant get user');
    }
  }

  @override
  Future<void> updateUser(ChatUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant update user',
        isFirstTime: false,
      );

  Future<void> _addOrUpdateUser(
    ChatUser user, {
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
  Future<ChatUser> findUserByEmail(String email) {
    return _findUserByEmail(email);
  }

  Future<ChatUser> _findUserByEmail(String email) async {
    try {
      final response = await _db
          .collection(Collections.users)
          .where('email', isEqualTo: email)
          .get();
      return UserDTO.fromJson(response.docs.first.data()).toDomain();
    } catch (e) {
      throw NoUserWithEmailException(
        message: ErrorMessages.database.cantFindUserUid,
      );
    }
  }

  @override
  Future<void> sendInvitation({
    required String from,
    required String to,
  }) async {
    final canSendInvitation = await _canSendInvitation(
      from: from,
      to: to,
    );
    if (canSendInvitation) {
      await _db
          .collection(Collections.invitations)
          .doc(to)
          .collection(Collections.invites)
          .add(
            InvitationDTO(DateTime.now(), from).toJson(),
          )
          .onError(
            (_, __) => throw throw InvitationException(
              message: ErrorMessages.invitation.sendingInvitationError,
            ),
          );
    } else {
      throw InvitationException(
        message: ErrorMessages.invitation.alreadySentInvitation,
      );
    }
  }

  Future<bool> _canSendInvitation({
    required String from,
    required String to,
  }) async {
    try {
      final docsForInvitations = await _db
          .collection(Collections.invitations)
          .doc(to)
          .collection(Collections.invites)
          .where(
            'senderUid',
            isEqualTo: from,
          )
          .get();
      final docsForFriends = await _db
          .collection(Collections.contacts)
          .doc(from)
          .collection(Collections.friends)
          .where(
            'senderUid',
            isEqualTo: to,
          )
          .get();
      return docsForInvitations.size == 0 &&
          docsForFriends.size == 0 &&
          from != to;
    } catch (e) {
      throw DatabaseException(message: 'Cant get data');
    }
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

  Future<void> deleteInvitation(String userUid, Invitation invitation) async {
    try {
      await _deleteInvitation(userUid, invitation);
    } catch (e) {
      throw DatabaseException(message: 'Cant delete invitation');
    }
  }

  @override
  Future<void> acceptInvitation(
    String userUid,
    Invitation invitation,
  ) async {
    try {
      await _addFriend(userUid, invitation.senderUid);
      await _addFriend(invitation.senderUid, userUid);
      await _deleteInvitation(userUid, invitation);
    } catch (e) {
      throw DatabaseException(message: 'Cant accept invitation');
    }
  }

  Future<void> _addFriend(String userUuid, String friendUuid) async {
    await _db
        .collection(Collections.contacts)
        .doc(userUuid)
        .collection(Collections.friends)
        .add(
          InvitationDTO(DateTime.now(), friendUuid).toJson(),
        );
  }

  Future<void> _deleteInvitation(
    String userUid,
    Invitation invitation,
  ) async {
    await _db
        .collection(Collections.invitations)
        .doc(userUid)
        .collection(Collections.invites)
        .doc(invitation.uid)
        .delete();
  }

  @override
  Future<List<ChatUser>> getAllFriends(String userUuid) async {
    final List<String> uuids = await _db
        .collection(Collections.contacts)
        .doc(userUuid)
        .collection(Collections.friends)
        .get()
        .then((value) {
      return value.docs.map<String>((e) {
        final data = e.data();
        return data['senderUid'];
      }).toList();
    });
    final friends = <ChatUser>[];
    await Future.forEach<String>(uuids, (uuid) async {
      ChatUser friend = await findUserByUid(uuid);
      friends.add(friend);
    });

    return friends;
  }

  Future<ChatUser> findUserByUid(String uuid) async {
    final response = await _db.collection(Collections.users).doc(uuid).get();
    final json = response.data();
    return UserDTO.fromJson(json).toDomain();
  }
}
