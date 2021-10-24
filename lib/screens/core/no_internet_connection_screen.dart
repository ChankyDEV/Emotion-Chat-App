import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You don\'t have internet connection',
        textAlign: TextAlign.center,
        style: titleStyle,
      ),
    );
  }
}
