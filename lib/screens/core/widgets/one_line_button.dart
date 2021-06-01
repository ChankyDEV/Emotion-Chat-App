import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class OneLineButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color linesColor;

  const OneLineButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.linesColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(height: 2, color: linesColor),
          ),
          Container(
            height: 7,
            width: 7,
            color: linesColor,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: bodyStyle.copyWith(fontSize: 13.0),
          ),
          const SizedBox(width: 10),
          Container(
            height: 7,
            width: 7,
            color: linesColor,
          ),
          Expanded(
            child: Container(height: 2, color: linesColor),
          ),
        ],
      ),
    );
  }
}
