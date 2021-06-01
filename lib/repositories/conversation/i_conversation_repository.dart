import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';

abstract class IConversationRepository {
  Future<Either<ConversationFailure, List<Conversation>>>
      getLimitedConversations(int limit);
  Future<Either<ConversationFailure, List<Conversation>>> getAllConversations();

  Future<Either<ConversationFailure, Unit>> deleteConversation(
      Conversation conversation);
  Future<Either<ConversationFailure, Unit>> createNewConversationWithUser(
      User user);
  Future<Either<ConversationFailure, List<User>>> getAllUsersForConversation(
      Conversation conversation);
}
