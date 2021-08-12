import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';

abstract class IDatabaseService {
  Future<Either<DatabaseFailure, List<Conversation>>> getLimitedConversations(
      int limit);
  Future<Either<DatabaseFailure, List<Conversation>>> getAllConversations();

  Future<Either<DatabaseFailure, Unit>> deleteConversation(
      Conversation conversation);
  Future<Either<DatabaseFailure, Unit>> createNewConversationWithUser(
      MyUser user);
  Future<Either<DatabaseFailure, List<MyUser>>> getAllUsersForConversation(
      Conversation conversation);

  Future<Either<DatabaseFailure, List<MyUser>>> getAllContacts();
  Future<Either<DatabaseFailure, Unit>> deleteContact(MyUser contactToDelete);
  Future<Either<DatabaseFailure, Unit>> addContact(MyUser contactToAdd);

  Future<Either<DatabaseFailure, Unit>> saveMessage(
      Message message, Conversation conversation);
}
