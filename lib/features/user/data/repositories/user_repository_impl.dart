import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/logger/domain/chat_logger.dart';
import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/utils/data/repositories/collections.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final ChatLogger _logger;

  UserRepositoryImpl(this._logger);

  @override
  Future<String> findUserUuidByEmail(String email) async {
    _logger.info('Try to find user uuid by email [$email]');
    final user = await _findUserByEmail(email);
    return user.uuid;
  }

  @override
  Future<ChatUser> findUserByEmail(String email) async {
    _logger.info('Try to find user by email [$email]');
    return _findUserByEmail(email);
  }

  Future<ChatUser> _findUserByEmail(String email) async {
    try {
      final response = await _db
          .collection(Collections.users)
          .where('email', isEqualTo: email)
          .get();
      final user = UserDTO.fromJson(response.docs.first.data()).toDomain();
      _logger.info('Got user ${user.toString()} by email [$email]');
      return user;
    } catch (e) {
      _logger.warning('Could not find user by email [$email]');
      throw NoUserWithEmailException(
        message: ErrorMessages.database.cantFindUserUid,
      );
    }
  }

  @override
  Future<ChatUser> findUserByUuid(uuid) async {
    _logger.info('Try to find user by uuid [$uuid]');
    try {
      final response = await _db.collection(Collections.users).doc(uuid).get();
      final json = response.data();
      final user = UserDTO.fromJson(json).toDomain();
      _logger.info('Got user ${user.toString()} by uuid [$uuid]');
      return user;
    } catch (e) {
      _logger.warning('Could not find user by uuid [$uuid]');
      throw DatabaseException(message: ErrorMessages.database.cantFindUserUid);
    }
  }

  @override
  Future<void> addUser(ChatUser user) => _addOrUpdateUser(
        user,
        onErrorMessage: 'Cant add user',
      );

  @override
  Future<ChatUser> getUser(String uuid) async {
    _logger.info('Try to get user by uuid [$uuid]');
    try {
      final response = await _db.collection(Collections.users).doc(uuid).get();
      final user = UserDTO.fromJson(response.data()).toDomain();
      _logger.info('Got user ${user.toString()} by uuid [$uuid]');
      return user;
    } catch (e) {
      _logger.warning('Could not find user by uuid [$uuid]');
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
    _logger.info('Try to add or update user [${user.toString()}]');
    try {
      await _db
          .collection(Collections.users)
          .doc(user.uuid)
          .set(user.fromDomain().toJson());
      if (isFirstTime) {
        await _db
            .collection(Collections.invitations)
            .doc(user.uuid)
            .collection(Collections.invites)
            .add(
              Invitation.empty().toJson(),
            );
        _logger.info('Added empty invitation for user [${user.toString()}]');
      }
      _logger.info('Successfully added or updated user [${user.toString()}]');
    } catch (e) {
      _logger.error(
          'Error occurred while trying to add or update user [${user.toString()}]');
      throw AuthException(message: onErrorMessage);
    }
  }
}
