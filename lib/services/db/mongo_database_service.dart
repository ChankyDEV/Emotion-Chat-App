import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/services/db/i_db_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDatabaseService)
class MongoDatabaseService implements IDatabaseService {
  @override
  Future<Either<DatabaseFailure, Unit>> addContact(MyUser contactToAdd) {
    // TODO: implement addContact
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, Unit>> createNewConversationWithUser(
      MyUser user) {
    // TODO: implement createNewConversationWithUser
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, Unit>> deleteContact(MyUser contactToDelete) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, Unit>> deleteConversation(
      Conversation conversation) {
    // TODO: implement deleteConversation
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<MyUser>>> getAllContacts() {
    // TODO: implement getAllContacts
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<Conversation>>> getAllConversations() {
    // TODO: implement getAllConversations
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<MyUser>>> getAllUsersForConversation(
      Conversation conversation) {
    // TODO: implement getAllUsersForConversation
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<Conversation>>> getLimitedConversations(
      int limit) {
    // TODO: implement getLimitedConversations
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, Unit>> saveMessage(
      Message message, Conversation conversation) {
    // TODO: implement saveMessage
    throw UnimplementedError();
  }
}
