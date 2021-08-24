import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/auth/user_props.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseAuthService implements IAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _db;

  @override
  BehaviorSubject<MyUser> currentUser = BehaviorSubject<MyUser>();

  FirebaseAuthService(this._db);

  @override
  void addInfoAboutUserToStream(MyUser user) {
    currentUser.add(user);
  }

  @override
  void close() {
    currentUser.close();
  }

  @override
  Future<MyUser> getSignedInUser() async {
    final currentUserUid = _auth.currentUser!.uid;
    return _db.getUser(currentUserUid);
  }

  @override
  Future<MyUser> signInWithEmail({
    required EmailAddress? emailAddress,
    required Password? password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailAddress!.value, password: password!.value);
      return await getSignedInUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email' || e.code == 'wrong-password') {
        throw AuthException(message: 'Wrong email or password');
      } else if (e.code == 'user-disabled') {
        throw AuthException(message: 'User is blocked');
      } else if (e.code == 'user-not-found') {
        throw AuthException(message: 'Password is too weak');
      } else {
        throw AuthException(message: 'Unknown error');
      }
    }
  }

  MyUser _fromFirebaseUser(
      UserCredential userCredential, PhoneNumber? phoneNumber) {
    final user = userCredential.user;
    return MyUser(
      phoneNumber: PhoneNumber(value: phoneNumber!.value.toString()),
      emailAddress: EmailAddress(value: user!.email.toString()),
      name: Name(value: ''),
      hasOwnImage: false,
      gender: Gender(value: GenderEnum.male),
      profileImage: ProfileImage.empty(),
      contactsUIDS: [],
      uid: user.uid,
    );
  }

  @override
  Future<MyUser> signInWithPhoneNumber({
    required PhoneNumber? phoneNumber,
    required Password? password,
  }) {
    throw Exception();
  }

  @override
  Future<MyUser> signUpWithEmailAndPhone({
    required EmailAddress? emailAddress,
    required PhoneNumber? phoneNumber,
    required Password? password,
  }) async {
    try {
      final firebaseUserResult = await _auth.createUserWithEmailAndPassword(
          email: emailAddress!.value, password: password!.value);
      return _fromFirebaseUser(firebaseUserResult, phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthException(message: 'Email is already in use');
      } else if (e.code == 'invalid-email') {
        throw AuthException(message: 'Wrong credentials');
      } else if (e.code == 'weak-password') {
        throw AuthException(message: 'Password is too weak');
      } else {
        throw AuthException(message: 'Unknown error');
      }
    }
  }

}
