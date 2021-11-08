import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/chat/domain/entities/conversation.dart';
import 'package:emotion_chat/features/chat/domain/entities/message.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

abstract class ChatService {
  Future<Either<Failure, Unit>> sendMessage({
    required String messageContent,
    required String messageReceiverUuid,
  });

  Future<Either<Failure, Stream<List<Message>>>> getMessagesStream({
    required String messageReceiverUuid,
    required int limit,
  });

  Future<Either<Failure, Stream<List<Conversation>>>> get conversations;
}
