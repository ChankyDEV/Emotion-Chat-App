import 'package:emotion_chat/features/user/presentation/models/form_input.dart';
import 'package:emotion_chat/utils/data/utils/validator.dart';
import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final InputType inputType;
  final TextEditingController controller;
  final VoidCallback action;
  final bool isTextVisible;
  final bool validate;
  final bool useOutlineInputBorder;
  final TextInputAction textInputAction;
  final FocusScopeNode? formNode;
  final Function(String) onSubmitted;

  const MyTextField({
    Key? key,
    this.formNode,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.inputType,
    required this.controller,
    required this.action,
    required this.isTextVisible,
    required this.textInputAction,
    required this.onSubmitted,
    this.validate = true,
    this.useOutlineInputBorder = false,
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
          if (validate) {
            final validator = GetIt.I.get<Validator>();
            return validator.validate(
              inputType,
              value,
            );
          }
        },
        obscureText:
            inputType == InputType.password ? !isTextVisible : !isTextVisible,
        enableSuggestions: false,
        enableInteractiveSelection: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: cLightGrey,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: cWhite,
                  size: 20,
                )
              : null,
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
            onPressed: () {
              action();
              FocusScope.of(context).unfocus();
            },
          ),
          errorStyle: const TextStyle(
              color: Colors.red, fontSize: 13, fontFamily: 'Lato'),
          focusedErrorBorder: _chooseBorderType(cLightGrey),
          errorBorder: _chooseBorderType(Colors.red),
          focusedBorder: _chooseBorderType(cLightGrey),
          enabledBorder: _chooseBorderType(cLightGrey),
          hintText: hint,
          hintStyle: const TextStyle(
              color: cLightGrey, fontSize: 13, fontFamily: 'Lato'),
        ),
      ),
    );
  }

  InputBorder _chooseBorderType(Color color) {
    if (useOutlineInputBorder) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(24.0),
      );
    } else {
      return UnderlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
          style: BorderStyle.solid,
        ),
      );
    }
  }
}
