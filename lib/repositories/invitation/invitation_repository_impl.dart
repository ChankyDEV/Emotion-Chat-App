import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class InvitationRepositoryImpl implements InvitationRepository {
  final DatabaseService db;
  final ILocalDatabaseService local;

  InvitationRepositoryImpl({
    required this.db,
    required this.local,
  });

  @override
  Future<Either<Failure, Unit>> sendInvitationForEmail(String email) async {
    final isUserSaved = await local.isUserSaved();
    if (isUserSaved) {
      try {
        final userToInvite = await db.findUserUidByEmail(email);
        final savedUser = await local.getUser();
        await db.sendInvitation(
          from: savedUser.uid,
          to: userToInvite,
        );
        return right(unit);
      } on NoUserWithEmailException catch (e) {
        return left(Failure(
          message: e.message,
        ));
      }
    } else {
      return left(Failure(message: 'Cant send invitation now'));
    }
  }

  @override
  Stream<Invitation> get invitations => db.invitations;
}
