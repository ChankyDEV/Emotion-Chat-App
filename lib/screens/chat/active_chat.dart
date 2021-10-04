import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class ActiveChat extends StatelessWidget {
  final ChatUser userToChatWith;

  const ActiveChat({
    required this.userToChatWith,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: cDarkGrey,
      ),
      body: Center(
        child: Text(
          userToChatWith.name.value,
          style: titleStyle,
        ),
      ),
    );
  }
}
