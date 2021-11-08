import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/friend/domain/entities/inviter.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

abstract class FriendsService {
  Future<Either<Failure, List<ChatUser>>> getAllFriends();
  Future<Either<Failure, Unit>> sendInvitation(String uid);

  Future<Either<Failure, Unit>> deleteInvitation(Invitation invitation);

  Future<Either<Failure, Unit>> acceptInvitation(Invitation invitation);

  Future<Either<Failure, Stream<List<Inviter>>>> get invitations;
}
