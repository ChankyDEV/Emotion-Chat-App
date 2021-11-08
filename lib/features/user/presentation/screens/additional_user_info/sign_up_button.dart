import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:emotion_chat/utils/presentation/consts/styles.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  final Function onTap;
  final bool isButtonClicked;
  final bool hasErrors;
  final bool updateWentWell;
  final GlobalKey<FormState> formKey;

  const SignUpButton(
      {Key? key,
      required this.onTap,
      required this.isButtonClicked,
      required this.hasErrors,
      required this.updateWentWell,
      required this.formKey})
      : super(key: key);
  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation<double> _width;
  late Animation<Color?> _color;
  @override
  void initState() {
    _buttonController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    _width = Tween<double>(begin: 120, end: 45).animate(CurvedAnimation(
        curve: Interval(0, 0.3, curve: Curves.linear),
        parent: _buttonController));
    _color = TweenSequence<Color?>([
      TweenSequenceItem(
          tween: ColorTween(begin: whiteColor, end: purpleAccent), weight: 33),
      TweenSequenceItem(
          tween: ColorTween(
            begin: purpleAccent,
            end: Colors.green,
          ),
          weight: 33),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.green, end: Colors.teal), weight: 33),
    ]).animate(CurvedAnimation(
        curve: Interval(0.5, 1, curve: Curves.linear),
        parent: _buttonController));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SignUpButton oldWidget) {
    if (widget.hasErrors) {
      _buttonController.reset();
    }
    if (widget.updateWentWell) {
      _buttonController.stop();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: Key('signUpButton'),
        onTap: () {
          if (!widget.isButtonClicked) {
            if (widget.formKey.currentState!.validate()) {
              widget.onTap();
              _buttonController.forward()
                ..whenComplete(
                    () => _buttonController.repeat(min: 0.3, reverse: true));
            }
          }
        },
        child: AnimatedBuilder(
          animation: _buttonController,
          builder: (context, _) {
            return Container(
                width: _width.value,
                height: 45,
                alignment: Alignment.center,
                child: Text(
                  _buttonController.status == AnimationStatus.forward ||
                          _buttonController.status ==
                              AnimationStatus.completed ||
                          _buttonController.status == AnimationStatus.reverse
                      ? ''
                      : 'Sign Up'.toUpperCase(),
                  style: bodyStyle.copyWith(color: backgroundColor),
                ),
                decoration: BoxDecoration(
                  color: _color.value,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ));
          },
        ));
  }
}
