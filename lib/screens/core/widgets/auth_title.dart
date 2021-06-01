import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final Color lineColor;

  const AuthTitle({Key? key, required this.title, required this.lineColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: width / 12),
          alignment: Alignment.centerLeft,
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
                fontSize: 28.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Container(width: width / 2, height: 2, color: mBeige),
            Container(
              height: 7,
              width: 7,
              color: lineColor,
            ),
          ],
        )
      ],
    );
  }
}
