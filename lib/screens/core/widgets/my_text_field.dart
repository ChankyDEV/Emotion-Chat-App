import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/helpers/validator.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final InputType inputType;
  final TextEditingController controller;
  final VoidCallback action;
  final bool isTextVisible;
  final TextInputAction textInputAction;
  final FocusScopeNode? formNode;
  final Function(String) onSubmitted;

  const MyTextField({
    Key? key,
    this.formNode,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    required this.inputType,
    required this.controller,
    required this.action,
    required this.isTextVisible,
    required this.textInputAction,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onFieldSubmitted: (value) => onSubmitted(value),
        textInputAction: textInputAction,
        controller: controller,
        key: Key('emailOrPhone'),
        style: const TextStyle(
          color: cLightGrey,
          fontSize: 13,
          fontFamily: 'Lato',
        ),
        validator: (value) {
          final validator = GetIt.I.get<Validator>();
          return validator.validate(
            inputType,
            value,
          );
        },
        obscureText:
            inputType == InputType.password ? !isTextVisible : !isTextVisible,
        enableSuggestions: false,
        enableInteractiveSelection: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: cLightGrey,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: cWhite,
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              inputType == InputType.password
                  ? isTextVisible
                      ? Icons.visibility
                      : suffixIcon
                  : suffixIcon,
              size: 16.0,
              color: cLightGrey,
            ),
            onPressed: action,
          ),
          errorStyle: const TextStyle(
              color: Colors.red, fontSize: 13, fontFamily: 'Lato'),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red, width: 1, style: BorderStyle.solid)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red, width: 1, style: BorderStyle.solid)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: cLightGrey, width: 1, style: BorderStyle.solid)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: cLightGrey, width: 1, style: BorderStyle.solid)),
          hintText: hint,
          hintStyle: const TextStyle(
              color: cLightGrey, fontSize: 13, fontFamily: 'Lato'),
        ),
      ),
    );
  }
}
