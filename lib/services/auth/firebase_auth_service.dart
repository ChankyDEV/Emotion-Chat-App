import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/auth/user_props.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';

@LazySingleton(as: IAuthService)
class FirebaseAuthService implements IAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  BehaviorSubject<MyUser>? currentUser = BehaviorSubject<MyUser>();

  @override
  void addInfoAboutUserToStream(MyUser user) {
    currentUser!.add(user);
  }

  @override
  void close() {
    currentUser!.close();
  }

  @override
  Future<MyUser> getSignedInUser() async {
    final currentUserUid = _auth.currentUser!.uid;
    final response = await _db.collection('users').doc(currentUserUid).get();

    return UserDTO.fromJson(response.data()).toDomain();
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
      final user = _fromFirebaseUser(firebaseUserResult, phoneNumber);
      _db.collection('users').doc(user.uid).set(user.fromDomain().toJson());
      return user;
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

  @override
  Future<MyUser> updateUserInfo({
    required Name? name,
    required Gender? gender,
    required bool? hasOwnImage,
    required String? uid,
    required String? generatedImageUploadUrl,
  }) async {
    final user = await getSignedInUser();
    final updatedUser = MyUser(
      phoneNumber: user.phoneNumber,
      emailAddress: user.emailAddress,
      name: name!,
      hasOwnImage: hasOwnImage!,
      gender: gender!,
      profileImage: user.profileImage,
      contactsUIDS: user.contactsUIDS,
      uid: user.uid,
    );
    await _db
        .collection('users')
        .doc(user.uid)
        .set(updatedUser.fromDomain().toJson());
    return await getSignedInUser();
  }
}
