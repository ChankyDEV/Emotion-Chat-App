import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final bool isPasswordVisible;
  final VoidCallback hideOrShowPassword;
  final TextEditingController passwordController;

  const PasswordTextField(
      {Key? key,
      required this.isPasswordVisible,
      required this.hideOrShowPassword,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: mBlack,
            blurRadius: 2,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: TextFormField(
        key: Key('password'),
        style: textFormStyle.copyWith(color: textColor),
        validator: (value) {
          Password password = Password(value: value!);
          if (!password.isValid()) {
            return 'Password has to be longer than five letters\nconsists at least one big one diacritic latter';
          }
          return null;
        },
        controller: passwordController,
        enableSuggestions: false,
        enableInteractiveSelection: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !isPasswordVisible,
        cursorColor: mBlack,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye,
              size: 21.0,
              color: lightAccentColor,
            ),
            onPressed: hideOrShowPassword,
          ),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              borderSide: BorderSide.none),
          hintText: 'Password',
          hintStyle: textFormStyle.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
