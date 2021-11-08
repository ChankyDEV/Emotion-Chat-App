import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Phone Number', () {
    const properPhoneNumber = PhoneNumber(value: '796262965');
    const wrongPhoneNumber = PhoneNumber(value: '7962665');
    const emptyPhoneNumber = PhoneNumber(value: '              ');
    test('If valid return true', () {
      final result = properPhoneNumber.isValid();

      expect(result, true);
    });

    test('If not valid return false', () {
      final result = wrongPhoneNumber.isValid();

      expect(result, false);
    });
    test('If its empty return false', () {
      final result = emptyPhoneNumber.isValid();
      expect(result, false);
    });
  });
}
