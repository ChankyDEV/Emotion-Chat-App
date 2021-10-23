import 'package:emotion_chat/data/models/conversation/conversation.dart';
import 'package:emotion_chat/data/models/conversation/message.dart';

abstract class ConversationDatabase {
  Future<Stream<List<Message>>> getMessagesStreamFor(List<String> members);

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
