import 'package:emotion_chat/constants/data.dart';
import 'package:flutter/material.dart';

class Conversation {
  final String conversationID;
  final List<Message> messages;
  final List<String> membersIDS;

  Conversation(
      {required this.conversationID,
      required this.messages,
      required this.membersIDS});
}
