import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/conversation/message.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/repositories/chat/chat_repository.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class ChatRepositoryImpl implements ChatRepository {
  final LocalDatabaseService _local;
  final NetworkService _network;
  final DatabaseService _db;

  ChatRepositoryImpl(
    this._local,
    this._network,
    this._db,
  );

  @override
  Future<Either<Failure, Stream<List<Message>>>> getMessagesStream({
    required String messageReceiverUuid,
  }) async {
    final uuid = (await _local.getUser()).uid;
    try {
      final stream = await _db.getMessagesStreamFor([
        uuid,
        messageReceiverUuid,
      ]);
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
    final uuid = (await _local.getUser()).uid;
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
}