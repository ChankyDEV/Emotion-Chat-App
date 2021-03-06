import 'dart:async';

import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/domain/entities/gender_enum.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/features/user/domain/repositories/auth_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _auth = FirebaseAuth.instance;
  final StreamController<UserDTO> _currentUserController;
  final UserRepository _userRepository;

  AuthRepositoryImpl(
    this._userRepository,
    this._currentUserController,
  );

  @override
  Stream<UserDTO> get currentUser => _currentUserController.stream;

  @override
  Future<void> addInfoAboutUserToStream(ChatUser user) async {
    _currentUserController.add(
      user.fromDomain(),
    );
  }

  @override
  void close() {
    _currentUserController.close();
  }

  @override
  Future<ChatUser> getSignedInUser() async {
    final currentUserUid = _auth.currentUser!.uid;
    return _userRepository.getUser(currentUserUid);
  }

  @override
  Future<ChatUser> signInWithEmail({
    required EmailAddress? emailAddress,
    required Password? password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailAddress!.value, password: password!.value);
      return await getSignedInUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email' ||
          e.code == 'wrong-password' ||
          e.code == 'user-not-found') {
        throw AuthException(message: 'Wrong email or password');
      } else if (e.code == 'user-disabled') {
        throw AuthException(message: 'User is blocked');
      } else {
        throw AuthException(message: 'Unknown error');
      }
    }
  }

  ChatUser _fromFirebaseUser(
      UserCredential userCredential, PhoneNumber? phoneNumber) {
    final user = userCredential.user;
    return ChatUser(
      phoneNumber: PhoneNumber(value: phoneNumber!.value.toString()),
      emailAddress: EmailAddress(value: user!.email.toString()),
      name: Name(value: ''),
      hasOwnImage: false,
      gender: Gender(value: GenderEnum.male),
      profileImage: ProfileImage.empty(),
      uuid: user.uid,
    );
  }

  @override
  Future<ChatUser> signInWithPhoneNumber({
    required PhoneNumber? phoneNumber,
    required Password? password,
  }) {
    throw Exception();
  }

  @override
  Future<ChatUser> signUpWithEmailAndPhone({
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
