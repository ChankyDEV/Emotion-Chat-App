String removeSpacesFromString(String input) {
  String emailOrPhone = input;
  if (input.contains(' ')) {
    emailOrPhone = emailOrPhone.split(" ").join();
  }
  return emailOrPhone;
}
