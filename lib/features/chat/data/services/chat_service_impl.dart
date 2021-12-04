import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/chat/domain/entities/conversation.dart';
import 'package:emotion_chat/features/chat/domain/entities/message.dart';
import 'package:emotion_chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:emotion_chat/features/chat/domain/services/chat_service.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

class ChatServiceImpl implements ChatService {
  final LocalRepository _localRepository;
  final NetworkInfo _networkInfo;
  final ChatRepository _chatRepository;
  final UserRepository _userRepository;

  ChatServiceImpl(
    this._localRepository,
    this._networkInfo,
    this._chatRepository,
    this._userRepository,
  );

  @override
  Future<Either<Failure, Stream<List<Message>>>> getMessagesStream({
    required String messageReceiverUuid,
    required int limit,
  }) async {
    final uuid = (await _localRepository.getUser()).uuid;
    try {
      final stream = await _chatRepository.getMessagesStreamFor(
        [
          uuid,
          messageReceiverUuid,
        ],
        limit,
      );
      return right(stream);
    } catch (e) {
      return left(Failure(message: 'message'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({
    required String messageContent,
    required String messageReceiverUuid,
  }) async {
    final uuid = (await _localRepository.getUser()).uuid;
    try {
      await _chatRepository.sendMessage(
        from: uuid,
        to: messageReceiverUuid,
        message: messageContent,
      );
      return right(unit);
    } catch (e) {
      return left(Failure(message: 'message'));
    }
  }

  @override
  Future<Either<Failure, Stream<List<Conversation>>>> get conversations =>
      _getConversationStream();

  Future<Either<Failure, Stream<List<Conversation>>>>
      _getConversationStream() async {
    try {
      final user = await _localRepository.getUser();
      final stream = await _chatRepository.getConversationStream(
        user.uuid,
        onFindUser: _userRepository.findUserByUuid,
      );
      return right(stream);
    } catch (e) {
      return left(Failure(message: 'message'));
    }
  }
}
