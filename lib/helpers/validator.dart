import 'package:emotion_chat/data/enums/form_input.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';

import './extensions.dart';

class Validator {
  String? validate(InputType inputType, String? input) {
    if (inputType == InputType.emailAddress) {
      EmailAddress email = EmailAddress(value: input!);
      if (!email.isValid()) {
        return 'Email address is not valid';
      }
    } else if (inputType == InputType.phoneNumber) {
      String convertedValue = input!.removeSpacesFromString();
      PhoneNumber phone = PhoneNumber(value: convertedValue);

      if (!phone.isValid()) {
        return 'Phone number has to nine numbers';
      }
    } else if (inputType == InputType.both) {
      if (input!.contains(' ')) {
        input = input.replaceAll(' ', '');
      }
      EmailAddress email = EmailAddress(value: input);
      PhoneNumber phone = PhoneNumber(value: input);

      if (email.isValid() || phone.isValid()) {
        // valid data
      } else {
        return 'Email or phone number is not valid';
      }
    } else if (inputType == InputType.password) {
      Password password = Password(value: input!);
      if (!password.isValid()) {
        return 'Password has to be longer than five letters\nconsists at least one big one diacritic latter';
      }
    }
    return null;
  }
}
