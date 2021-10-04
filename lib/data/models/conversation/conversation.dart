import 'package:emotion_chat/constants/data.dart';

class Conversation {
  final String uuid;
  final List<ChatUser> members;

  Conversation({
    required this.uuid,
    required this.members,
  });
}
