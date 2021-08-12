import 'package:intl/intl.dart';

String removeSpacesFromString(String input) {
  String emailOrPhone = input;
  if (input.contains(' ')) {
    emailOrPhone = emailOrPhone.split(" ").join();
  }
  return emailOrPhone;
}

String formatDate(DateTime dateTime) {
  DateFormat formatter = DateFormat('HH:mm');
  return formatter.format(dateTime);
}
