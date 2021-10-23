import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/data/exceptions/error_messages.dart';
import 'package:emotion_chat/data/exceptions/exceptions.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';

abstract class UserDatabase {
  Future<ChatUser> findUserByUuid(uuid);

  Future<String> findUserUuidByEmail(String email);

  Future<ChatUser> findUserByEmail(String email);

  Future<void> addUser(ChatUser user);

  Future<void> updateUser(ChatUser user);

  Future<ChatUser> getUser(String uid);
}

class UserDatabaseImpl implements UserDatabase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<String> findUserUuidByEmail(String email) async {
    final user = await _findUserByEmail(email);
    return user.uid;
  }

  @override
  Future<ChatUser> findUserByEmail(String email) async {
    return _findUserByEmail(email);
  }

  Future<ChatUser> _findUserByEmail(String email) async {
    try {
      final response = await _db
          .collection(Collections.users)
          .where('email', isEqualTo: email)
          .get();
      return UserDTO.fromJson(response.docs.first.data()).toDomain();
    } catch (e) {
      throw NoUserWithEmailException(
        message: ErrorMessages.database.cantFindUserUid,
      );
    }
  }

  @override
  Future<ChatUser> findUserByUuid(uuid) async {
    final response = await _db.collection(Collections.users).doc(uuid).get();
    final json = response.data();
    return UserDTO.fromJson(json).toDomain();
  }

  @override
  Future<void> addUser(ChatUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant add user',
      );

  @override
  Future<ChatUser> getUser(String uid) async {
    try {
      final response = await _db.collection(Collections.users).doc(uid).get();
      return UserDTO.fromJson(response.data()).toDomain();
    } catch (e) {
      throw AuthException(message: 'Cant get user');
    }
  }

  @override
  Future<void> updateUser(ChatUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant update user',
        isFirstTime: false,
      );

  Future<void> _addOrUpdateUser(
    ChatUser user, {
    String onErrorMessage = '',
    bool isFirstTime = true,
    Function? onFirstTime,
  }) async {
    try {
      await _db
          .collection(Collections.users)
          .doc(user.uid)
          .set(user.fromDomain().toJson());
      if (isFirstTime) {
        await _db
            .collection(Collections.invitations)
            .doc(user.uid)
            .collection(Collections.invites)
            .add(
              Invitation.empty().toJson(),
            );
      }
    } catch (e) {
      throw AuthException(message: onErrorMessage);
    }
  }
}
