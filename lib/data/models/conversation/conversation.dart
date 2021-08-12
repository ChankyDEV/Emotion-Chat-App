import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/auth/receiver.dart';
import 'package:flutter/material.dart';

class Conversation {
  final String conversationID;
  final Message lastMessage;
  final Receiver receiver;

  Conversation(
      {required this.conversationID,
      required this.lastMessage,
      required this.receiver});
}
