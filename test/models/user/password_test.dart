import 'package:emotion_chat/constants/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Password', () {
    const properPassword = Password(value: 'Zxcv098!');
    const wrongPassword = Password(value: '1234');
    const emptyPassword = Password(value: '       ');

    test('If valid return true', () {
      final result = properPassword.isValid();

      expect(result, true);
    });

    test('If not valid return false', () {
      final result = wrongPassword.isValid();
      expect(result, false);
    });

    test('If its empty return false', () {
      final result = emptyPassword.isValid();
      expect(result, false);
    });
  });
}
