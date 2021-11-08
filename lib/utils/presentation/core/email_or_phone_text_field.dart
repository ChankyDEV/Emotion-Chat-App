import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/features/user/presentation/models/form_input.dart';
import 'package:emotion_chat/utils/data/utils/extensions.dart';
import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:emotion_chat/utils/presentation/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailOrPhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function clearFunction;
  final String hint;
  final Icon icon;
  final InputType formInput;
  final bool isPhoneNumber;

  const EmailOrPhoneTextField(
      {Key? key,
      required this.controller,
      required this.clearFunction,
      required this.hint,
      required this.icon,
      required this.isPhoneNumber,
      required this.formInput})
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
        key: Key('emailOrPhone'),
        style: textFormStyle.copyWith(color: textColor),
        validator: (value) {
          if (formInput == InputType.emailAddress) {
            EmailAddress email = EmailAddress(value: value!);
            if (!email.isValid()) {
              return 'Email address is not valid';
            }
          } else if (formInput == InputType.phoneNumber) {
            String convertedValue = value!.removeSpacesFromString();
            PhoneNumber phone = PhoneNumber(value: convertedValue);

            if (!phone.isValid()) {
              return 'Phone number has to nine numbers';
            }
          } else if (formInput == InputType.both) {
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
          }
          return null;
        },
        enableSuggestions: false,
        enableInteractiveSelection: false,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        cursorColor: mBlack,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.backspace,
              size: 18.0,
              color: lightAccentColor,
            ),
            onPressed: () {
              controller.clear();
              clearFunction();
            },
          ),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: textFormStyle.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
