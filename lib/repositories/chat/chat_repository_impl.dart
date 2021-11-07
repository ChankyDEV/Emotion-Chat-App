import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/conversation/conversation.dart';
import 'package:emotion_chat/data/models/conversation/message.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/repositories/chat/chat_repository.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class ChatRepositoryImpl implements ChatRepository {
  final LocalRepository _local;
  final NetworkInfo _network;
  final DatabaseService _db;

  ChatRepositoryImpl(
    this._local,
    this._network,
    this._db,
  );

  @override
  Future<Either<Failure, Stream<List<Message>>>> getMessagesStream({
    required String messageReceiverUuid,
    required int limit,
  }) async {
    final uuid = (await _local.getUser()).uuid;
    try {
      final stream = await _db.getMessagesStreamFor(
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
    final uuid = (await _local.getUser()).uuid;
    try {
      await _db.sendMessage(
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
      final user = await _local.getUser();
      final stream = await _db.getConversationStream(user.uuid);
      return right(stream);
    } catch (e) {
      return left(Failure(message: 'message'));
    }
  }
}
