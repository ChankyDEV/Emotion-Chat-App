import 'package:emotion_chat/blocs/animated_button/animatedbutton_cubit.dart';
import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onTap;
  final Color backgroundColor;
  final Color endColor;
  final Color shadowColor;
  final GlobalKey<FormState> formKey;

  const AnimatedButton(
      {Key? key,
      required this.formKey,
      required this.width,
      required this.height,
      required this.title,
      required this.onTap,
      required this.backgroundColor,
      required this.endColor,
      required this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimatedButtonCubit, AnimatedButtonState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            if (!state.isProcessing) {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AnimatedButtonCubit>(context).clicked();
                await onTap();
              } else {
                BlocProvider.of<AuthFormBloc>(context)
                    .add(AuthFormEvent.startValidating());
              }
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment.center,
            width: width,
            height: height,
            child: state.isPressed
                ? Text(
                    'Processing'.toUpperCase(),
                    style: bodyStyle.copyWith(color: textColor),
                  )
                : Text(
                    title.toUpperCase(),
                    style: bodyStyle.copyWith(color: textColor),
                  ),
            decoration: state.isPressed
                ? BoxDecoration(
                    color: endColor,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    border: Border.all(color: backgroundColor, width: 2),
                  )
                : BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: shadowColor,
                            blurRadius: 2,
                            spreadRadius: 0.5)
                      ]),
          ),
        );
      },
    );
  }
}
