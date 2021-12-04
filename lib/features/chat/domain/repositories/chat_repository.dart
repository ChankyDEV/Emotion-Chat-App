import 'package:emotion_chat/features/chat/domain/entities/conversation.dart';
import 'package:emotion_chat/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Stream<List<Message>>> getMessagesStreamFor(
    List<String> members,
    int limit,
  );

  Future<void> sendMessage({
    required String from,
    required String to,
    required String message,
  });

  Future<Stream<List<Conversation>>> getConversationStream(
    String uuid, {
    required Function onFindUser,
  });
}
