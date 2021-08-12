import 'package:emotion_chat/constants/data.dart';

class Message {
  final String senderID;
  final Content content;
  final DateTime dateTime;
  final bool isRead;

  Message({
    required this.content,
    required this.dateTime,
    required this.senderID,
    required this.isRead,
  });
}
