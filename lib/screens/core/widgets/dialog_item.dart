import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class DialogItem extends StatelessWidget {
  final double sideWidth;
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;

  const DialogItem(
      {Key? key,
        required this.sideWidth,
        required this.icon,
        required this.text,
        required this.backgroundColor,
        required this.iconColor,
        required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sideWidth,
      height: sideWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: bodyStyle.copyWith(color: textColor),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: backgroundColor,
      ),
    );
  }
}