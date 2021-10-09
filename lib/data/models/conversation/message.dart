import 'package:emotion_chat/constants/data.dart';

class Message {
  final String senderUid;
  final Content content;
  final DateTime createdAt;

  Message({
    required this.content,
    required this.createdAt,
    required this.senderUid,
  });
}
