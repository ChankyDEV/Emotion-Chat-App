import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/helpers/helpers.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final FormInput formInput;
  final TextEditingController controller;
  final VoidCallback action;
  final bool isTextVisible;
  final TextInputAction textInputAction;
  final FocusScopeNode? formNode;
  final VoidCallback onSubmitted;

  const MyTextField({
    Key? key,
    this.formNode,
    required this.hint,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.formInput,
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
        onFieldSubmitted: (_) => onSubmitted(),
        textInputAction: textInputAction,
        controller: controller,
        key: Key('emailOrPhone'),
        style: const TextStyle(
            color: cLightGrey, fontSize: 13, fontFamily: 'Lato'),
        validator: (value) {
          if (formInput == FormInput.emailAddress) {
            EmailAddress email = EmailAddress(value: value!);
            if (!email.isValid()) {
              return 'Email address is not valid';
            }
          } else if (formInput == FormInput.phoneNumber) {
            String convertedValue = removeSpacesFromString(value!);
            PhoneNumber phone = PhoneNumber(value: convertedValue);

            if (!phone.isValid()) {
              return 'Phone number has to nine numbers';
            }
          } else if (formInput == FormInput.both) {
            if (value!.contains(' ')) {
              value = value.replaceAll(' ', '');
            }
            EmailAddress email = EmailAddress(value: value);
            PhoneNumber phone = PhoneNumber(value: value);

            if (email.isValid() || phone.isValid()) {
              // valid data
            } else {
              return 'Email or phone number is not valid';
            }
          } else if (formInput == FormInput.password) {
            Password password = Password(value: value!);
            if (!password.isValid()) {
              return 'Password has to be longer than five letters\nconsists at least one big one diacritic latter';
            }
          }
          return null;
        },
        obscureText:
            formInput == FormInput.password ? !isTextVisible : !isTextVisible,
        enableSuggestions: false,
        enableInteractiveSelection: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: cLightGrey,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: cWhite,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              formInput == FormInput.password
                  ? isTextVisible
                      ? Icons.visibility
                      : suffixIcon
                  : suffixIcon,
              size: 24.0,
              color: cLightGrey,
            ),
            onPressed: action,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide(
                  color: Colors.red, width: 1, style: BorderStyle.solid)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide(
                  color: Colors.red, width: 1, style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide(
                  color: cLightGrey, width: 1, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
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
