import 'package:emotion_chat/constants/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Address', () {
    const properEmail = EmailAddress(value: 'KamilKoczan@wp.pl');
    const wrongEmail = EmailAddress(value: 'KamilKoczanwp.pl');
    const emptyEmail = EmailAddress(value: '       ');
    test('If valid return true', () {
      final result = properEmail.isValid();

      expect(result, true);
    });

    test('If not valid return false', () {
      final result = wrongEmail.isValid();
      expect(result, false);
    });

    test('If its empty return false', () {
      final result = emptyEmail.isValid();
      expect(result, false);
    });
  });
}
