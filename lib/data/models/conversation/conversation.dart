import 'package:emotion_chat/constants/data.dart';

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
