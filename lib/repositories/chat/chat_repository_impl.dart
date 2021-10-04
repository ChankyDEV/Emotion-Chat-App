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
    _db.getMessagesStreamFor([
      uuid,
      messageReceiverUuid,
    ]);
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({
    required String messageContent,
    required String messageReceiverUuid,
  }) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
