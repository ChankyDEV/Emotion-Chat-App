import 'package:emotion_chat/blocs/more_info_form/more_info_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameTextField extends StatelessWidget {
  final bool isNameTextFieldOpen;
  final GlobalKey<FormState> formKey;

  const NameTextField(
      {Key? key, required this.isNameTextFieldOpen, required this.formKey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      alignment: Alignment.center,
      child: Theme(
        data: ThemeData(primaryColor: whiteColor),
        child: Form(
          key: formKey,
          child: TextFormField(
            validator: (input) {
              Name name = Name(value: input!);
              if (!name.isValid()) {
                return 'Your name is incorrect';
              }
              return null;
            },
            onChanged: (value) => BlocProvider.of<MoreInfoFormBloc>(context)
                .add(MoreInfoFormEvent.nameChanged(input: value)),
            onTap: () => BlocProvider.of<MoreInfoFormBloc>(context)
                .add(MoreInfoFormEvent.openNameTextField()),
            style: textFormStyle.copyWith(
                color: whiteColor, fontSize: 12.0, fontStyle: FontStyle.normal),
            cursorColor: backgroundColor,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.backspace,
                color: isNameTextFieldOpen ? whiteColor : Colors.transparent,
                size: 18.0,
              ),
              labelText: '',
              labelStyle: bodyStyle.copyWith(fontSize: 16.0, color: whiteColor),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusColor: whiteColor,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: whiteColor, width: 1)),
              hintText: 'How your friends will see you',
              hintStyle: textFormStyle.copyWith(
                  color: Colors.grey[500], fontSize: 11.0),
            ),
          ),
        ),
      ),
    );
  }
}
