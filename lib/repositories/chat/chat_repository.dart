import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';

abstract class ChatRepository {
  Future<Either<Failure, Unit>> sendMessage({
    required String messageContent,
    required String messageReceiverUuid,
  });

  Future<Either<Failure, Stream<List<Message>>>> getMessagesStream({
    required String messageReceiverUuid,
  });

  Future<Either<Failure, Stream<List<Conversation>>>> get conversations;
}
