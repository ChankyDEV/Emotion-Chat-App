import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class LabeledIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final Color? noActiveColor;
  final bool? colorChangeCondition;
  final String label;

  const LabeledIconButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
    required this.color,
    this.noActiveColor,
    this.colorChangeCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colorChangeCondition ?? true ? color : noActiveColor,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            label,
            style: bodyStyle.copyWith(
              fontStyle: FontStyle.normal,
              fontSize: 10.0,
              color: colorChangeCondition ?? true ? color : noActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
