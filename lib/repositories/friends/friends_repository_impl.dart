import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/exceptions/error_messages.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/repositories/friends/friends_repository.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  final DatabaseService _db;
  final LocalDatabaseService _local;
  final NetworkService _network;

  FriendsRepositoryImpl(
    this._db,
    this._local,
    this._network,
  );

  @override
  Future<Either<Failure, List<ChatUser>>> getAllFriends() async {
    final hasConnection = await _network.isConnected;
    if (hasConnection) {
      try {
        final user = await _local.getUser();
        final friends = await _db.getAllFriends(user.uuid);
        return right(friends);
      } catch (e) {
        return left(
          Failure(message: 'some err'),
        );
      }
    } else {
      return left(
        Failure(message: ErrorMessages.internet.noConnection),
      );
    }
  }
}
