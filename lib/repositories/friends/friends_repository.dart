import 'package:dartz/dartz.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/data/models/core/failure.dart';

abstract class FriendsRepository {
  Future<Either<Failure, List<MyUser>>> getAllFriends();
}
