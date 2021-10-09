import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/conversation/message.dart';

class MessageDTO extends Message {
  MessageDTO(
    String content,
    DateTime createdAt,
    String senderUid,
  ) : super(
          content: Content(value: content),
          createdAt: createdAt,
          senderUid: senderUid,
        );

  factory MessageDTO.fromJson(Map<String, dynamic> json) {
    return MessageDTO(
      json['content'],
      json['createdAt'],
      json['senderUid'],
    );
  }

  factory MessageDTO.empty() {
    return MessageDTO(
      'first message',
      DateTime.now(),
      '123',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'createdAt': createdAt,
      'senderUid': senderUid,
    };
  }
}
