import 'package:dartz/dartz.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

abstract class InvitationRepository {
  Future<Either<Failure, Unit>> sendInvitation(String uid);

  Future<Either<Failure, Unit>> deleteInvitation(Invitation invitation);

  Future<Either<Failure, Unit>> acceptInvitation(Invitation invitation);

  Future<Stream<List<Invitation>>> get invitations;
}
