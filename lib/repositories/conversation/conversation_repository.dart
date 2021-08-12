import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/conversation/i_conversation_repository.dart';
import 'package:emotion_chat/services/db/i_db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IConversationRepository)
class ConversationRepository implements IConversationRepository {
  final IDatabaseService databaseService;

  ConversationRepository({
    required this.databaseService,
  });

  @override
  Future<Either<ConversationFailure, Unit>> createNewConversationWithUser(
      MyUser user) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ConversationFailure, Unit>> deleteConversation(
      Conversation conversation) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<ConversationFailure, List<Conversation>>>
      getAllConversations() {
    throw UnimplementedError();
  }

  @override
  Future<Either<ConversationFailure, List<Conversation>>>
      getLimitedConversations(int limit) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ConversationFailure, List<MyUser>>> getAllUsersForConversation(
      Conversation conversation) {
    throw UnimplementedError();
  }
}
