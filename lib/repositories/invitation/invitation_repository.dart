import 'package:dartz/dartz.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

abstract class InvitationRepository {
  Future<Either<Failure, Unit>> sendInvitationForEmail(String email);
  Stream<Invitation> get invitations;
}
