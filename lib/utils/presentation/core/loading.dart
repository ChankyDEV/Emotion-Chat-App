import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildLoadingIndicator());
  }

  Widget _buildLoadingIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          color: cWhite,
          backgroundColor: cDarkGrey,
        ),
      ],
    );
  }
}
