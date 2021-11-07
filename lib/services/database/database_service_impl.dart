import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/friend/domain/repositories/friends_repository.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/services/database/conversations/conversation_database_service.dart';
import 'package:emotion_chat/services/database/database_service.dart';

mixin Collections {
  static const users = 'users';
  static const invitations = 'invitations';
  static const invites = 'invites';
  static const conversations = 'conversations';
  static const contacts = 'contacts';
  static const friends = 'friends';
  static const messages = 'messages';
}

class DatabaseServiceImpl implements DatabaseService {
  late final FriendsRepository _friendsDatabase;
  late final ConversationDatabase _conversationDatabase;
  late final UserRepository _userRepository;

  DatabaseServiceImpl({
    required FriendsRepository friends,
    required ConversationDatabase conversations,
    required UserRepository users,
  }) {
    this._friendsDatabase = friends;
    this._conversationDatabase = conversations;
    this._userRepository = users;
  }

  @override
  Future<void> addUser(ChatUser user) async {
    await _userRepository.addUser(user);
  }

  @override
  Future<ChatUser> getUser(String uuid) async {
    return await _userRepository.getUser(uuid);
  }

  @override
  Future<void> updateUser(ChatUser user) async {
    await _userRepository.addUser(user);
  }

  @override
  Future<void> acceptInvitation(String userUuid, Invitation invitation) async {
    await _friendsDatabase.acceptInvitation(userUuid, invitation);
  }

  @override
  Future<void> deleteInvitation(String userUid, Invitation invitation) async {
    await _friendsDatabase.deleteInvitation(userUid, invitation);
  }

  @override
  Future<List<ChatUser>> getAllFriends(String userUid) async {
    return await _friendsDatabase.getAllFriends(
      userUid,
      onFindUser: _userRepository.findUserByUuid,
    );
  }

  @override
  Stream<List<Invitation>> getInvitationsStreamOnUid(String uid) {
    return _friendsDatabase.getInvitationsStreamOnUid(uid);
  }

  @override
  Future<void> sendInvitation({
    required String from,
    required String to,
  }) async {
    await _friendsDatabase.sendInvitation(from: from, to: to);
  }

  @override
  Future<ChatUser> findUserByEmail(String email) async {
    return await _userRepository.findUserByEmail(email);
  }

  @override
  Future<ChatUser> findUserByUuid(uuid) async {
    return await _userRepository.findUserByUuid(uuid);
  }

  @override
  Future<String> findUserUuidByEmail(String email) async {
    return await _userRepository.findUserUuidByEmail(email);
  }

  @override
  Future<Stream<List<Message>>> getMessagesStreamFor(
    List<String> members,
    int limit,
  ) async {
    return await _conversationDatabase.getMessagesStreamFor(
      members,
      limit,
    );
  }

  @override
  Future<void> sendMessage({
    required String from,
    required String to,
    required String message,
  }) async {
    await _conversationDatabase.sendMessage(
      from: from,
      to: to,
      message: message,
    );
  }

  @override
  Future<Stream<List<Conversation>>> getConversationStream(String uuid) async {
    return await _conversationDatabase.getConversationStream(
      uuid,
      onFindUser: _userRepository.findUserByUuid,
    );
  }
}
