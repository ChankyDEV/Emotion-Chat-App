import 'package:emotion_chat/utils/presentation/consts/styles.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final bool isSuccess;
  final String message;
  final double width;
  final double height;

  CustomSnackBar({
    required this.isSuccess,
    required this.message,
    required this.width,
    required this.height,
  }) : super(
          behavior: SnackBarBehavior.floating,
          content: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              message,
              style: bodyStyle.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 12.0,
          duration: Duration(milliseconds: 2500),
          backgroundColor: isSuccess ? Colors.green : Colors.red,
        );
}
