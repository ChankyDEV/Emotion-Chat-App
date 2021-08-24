import 'package:emotion_chat/constants/data.dart';
import 'package:rxdart/rxdart.dart';

abstract class IAuthService {
  Future<MyUser> signUpWithEmailAndPhone(
      {required EmailAddress? emailAddress,
      required PhoneNumber? phoneNumber,
      required Password? password});

  Future<MyUser> signInWithEmail(
      {required EmailAddress? emailAddress, required Password? password});

  Future<MyUser> signInWithPhoneNumber(
      {required PhoneNumber? phoneNumber, required Password? password});

  Future<MyUser> getSignedInUser();

  void addInfoAboutUserToStream(MyUser user);

  late BehaviorSubject<MyUser> currentUser;

  void close() {
    currentUser.close();
  }
}
