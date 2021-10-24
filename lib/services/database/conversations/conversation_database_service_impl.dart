import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/data/data_transfer_objects/messages/message_dto.dart';
import 'package:emotion_chat/data/models/conversation/conversation.dart';
import 'package:emotion_chat/data/models/conversation/message.dart';
import 'package:emotion_chat/services/database/conversations/conversation_database_service.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';

class ConversationDatabaseImpl implements ConversationDatabase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Stream<List<Message>>> getMessagesStreamFor(
    List<String> members,
    int limit,
  ) async {
    String conversationUid = await _getConversationUid(members);
    if (conversationUid.isEmpty) {
      conversationUid = await _createConversation(members[0], members[1]);
    }
    return _db
        .collection(Collections.conversations)
        .doc(conversationUid)
        .collection(Collections.messages)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map(_mapToMessage);
  }

  @override
  Future<void> sendMessage({
    required String from,
    required String to,
    required String message,
  }) async {
    String conversationUid = await _getConversationUid(<String>[from, to]);
    final msg = <String, dynamic>{
      'content': message,
      'createdAt': DateTime.now(),
      'senderUid': from,
    };
    if (conversationUid.isEmpty) {
      conversationUid = await _createConversation(from, to);
    }
    await _db
        .collection(Collections.conversations)
        .doc(conversationUid)
        .collection(Collections.messages)
        .add(msg);
  }

  List<Message> _mapToMessage(QuerySnapshot<Map<String, dynamic>> snapshot) {
    List<MessageDTO> messages = <MessageDTO>[];
    snapshot.docs.forEach((json) {
      Map<String, dynamic> jsonMap = {
        'content': json['content'],
        'createdAt': (json['createdAt'] as Timestamp).toDate(),
        'senderUid': json['senderUid'],
      };
      messages.add(MessageDTO.fromJson(jsonMap));
    });
    return messages;
  }

  Future<String> _createConversation(
    String firstMember,
    String secondMember,
  ) async {
    final doc = await _db.collection(Collections.conversations).add({
      'members': [firstMember, secondMember],
    });
    return doc.id;
  }

  Future<String> _getConversationUid(List<String> members) async {
    QuerySnapshot<Map<String, dynamic>> queryResult =
        await _db.collection(Collections.conversations).where(
      'members',
      isEqualTo: [members[0], members[1]],
    ).get();
    if (queryResult.docs.length == 0) {
      queryResult = await _db
          .collection(Collections.conversations)
          .where('members', isEqualTo: [members[1], members[0]]).get();
    }
    var a = queryResult;
    return queryResult.docs.length > 0 ? queryResult.docs.first.id : '';
  }

  @override
  Future<Stream<List<Conversation>>> getConversationStream(
    String uuid, {
    required Function onFindUser,
  }) async {
    return _db
        .collection(Collections.conversations)
        .where(
          'members',
          arrayContainsAny: [uuid],
        )
        .snapshots()
        .asyncMap(
          (event) async => _mapToConversations(
            event,
            uuid,
            onFindUser,
          ),
        );
  }

  Future<List<Conversation>> _mapToConversations(
    QuerySnapshot<Map<String, dynamic>> snapshots,
    String userUuid,
    Function onFindUser,
  ) async {
    final conversations = <Conversation>[];
    await Future.forEach<QueryDocumentSnapshot<Map<String, dynamic>>>(
        snapshots.docs, (snapshot) async {
      final json = snapshot.data();
      final members = <String>[json['members'][0], json['members'][1]];
      final friendUserUuid =
          members.firstWhere((element) => element != userUuid);
      final friend = await onFindUser(friendUserUuid);
      final stream = await getMessagesStreamFor(members, 2);
      final messages = await stream.first;
      if (messages.length > 0) {
        conversations.add(
          Conversation(
            uuid: snapshot.id,
            friend: friend,
            lastMessage: messages.first,
          ),
        );
      }
    });
    return conversations;
  }
}
