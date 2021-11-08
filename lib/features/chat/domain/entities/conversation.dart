import 'package:emotion_chat/features/chat/domain/entities/message.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';

class Conversation {
  final String uuid;
  final ChatUser friend;
  final Message lastMessage;

  Conversation({
    required this.uuid,
    required this.friend,
    required this.lastMessage,
  });

  @override
  String toString() {
    return '[$uuid]: ${friend.emailAddress} - ${lastMessage.content.value}';
  }
}
