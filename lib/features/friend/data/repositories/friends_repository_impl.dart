import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/data/exceptions/error_messages.dart';
import 'package:emotion_chat/data/exceptions/exceptions.dart';
import 'package:emotion_chat/features/friend/data/dtos/invitation_dto.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/friend/domain/repositories/friends_repository.dart';
import 'package:emotion_chat/features/logger/domain/chat_logger.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final ChatLogger _logger;

  FriendsRepositoryImpl(this._logger);

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
            InvitationDTO(
              DateTime.now(),
              from,
            ).toJson(),
          )
          .onError((_, __) {
        _logger.error(
          'Error occurred while trying to send invitation from [$from]  to [$to]',
        );
        throw InvitationException(
          message: ErrorMessages.invitation.sendingInvitationError,
        );
      });
      _logger.info('Send invitation from [$from] to [$to]');
    } else {
      _logger.warning('User [$from] already send an invitation to [$to]');
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
      _logger.error(
          'Error occurred while trying to get data if user can send invitation from [$from] to [$to]');
      throw DatabaseException(message: ErrorMessages.database.cantGetData);
    }
  }

  @override
  Stream<List<Invitation>> getInvitationsStreamOnUid(String uid) {
    return _db
        .collection(Collections.invitations)
        .doc(uid)
        .collection(Collections.invites)
        .orderBy(
          'createdAt',
          descending: true,
        )
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
    _logger.info(
      'Try to delete invitation from sender [${invitation.senderUid}] to user [$userUid]',
    );
    try {
      await _deleteInvitation(userUid, invitation);
      _logger.info(
        'Deleted invitation from sender [${invitation.senderUid}] to user [$userUid]',
      );
    } catch (e) {
      _logger.error(
        'Error occurred while deleting invitation from sender [${invitation.senderUid}] to user [$userUid]',
      );
      throw DatabaseException(message: 'Cant delete invitation');
    }
  }

  @override
  Future<void> acceptInvitation(
    String userUid,
    Invitation invitation,
  ) async {
    try {
      _logger.info(
        'Try to accept invitation from sender [${invitation.senderUid}] to user [$userUid]',
      );
      await _addFriend(userUid, invitation.senderUid);
      await _addFriend(invitation.senderUid, userUid);
      await _deleteInvitation(userUid, invitation);
      _logger.info(
        'Accepted invitation from sender [${invitation.senderUid}] to user [$userUid]',
      );
    } catch (e) {
      _logger.error(
        'Error occurred while accepting invitation from sender [${invitation.senderUid}] to user [$userUid]',
      );
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
  Future<List<ChatUser>> getAllFriends(
    String userUuid, {
    required Function onFindUser,
  }) async {
    _logger.info('Try to get all friends for user [$userUuid]');
    try {
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
        ChatUser friend = await onFindUser(uuid);
        friends.add(friend);
      });
      return friends;
    } catch (e) {
      _logger.error(
          'Error occurred while trying to get all friends for user [$userUuid]');
      throw DatabaseException(message: 'Cant get all friends');
    }
  }
}

typedef Future<ChatUser> FindUser(String uuid);
