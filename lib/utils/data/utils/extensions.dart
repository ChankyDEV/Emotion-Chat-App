import 'package:intl/intl.dart';

extension StringExtension on String {
  String removeSpacesFromString() {
    String emailOrPhone = this;
    if (this.contains(' ')) {
      emailOrPhone = emailOrPhone.split(" ").join();
    }
    return emailOrPhone;
  }

  String formatDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }
}
