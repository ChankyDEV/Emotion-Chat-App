import 'package:emotion_chat/utils/presentation/consts/styles.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'LOADING...',
          style: titleStyle,
        ),
      ),
    );
  }
}
