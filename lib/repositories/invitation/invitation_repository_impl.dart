import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/data/models/invitation/invitation_sender.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/services/database/database_service.dart';

class InvitationRepositoryImpl implements InvitationRepository {
  final DatabaseService db;
  final LocalDatabaseService local;
  final NetworkService network;

  InvitationRepositoryImpl({
    required this.db,
    required this.local,
    required this.network,
  });

  @override
  Future<Either<Failure, Unit>> sendInvitation(String uid) async {
    final isUserSaved = await local.isUserSaved();
    if (isUserSaved) {
      try {
        final savedUser = await local.getUser();
        await db.sendInvitation(
          from: savedUser.uid,
          to: uid,
        );
        return right(unit);
      } on NoUserWithEmailException catch (e) {
        return left(Failure(
          message: e.message,
        ));
      }
    } else {
      return left(
        Failure(message: 'Cant send invitation now'),
      );
    }
  }

  @override
  Future<Either<NetworkFailure, Stream<List<Inviter>>>> get invitations async =>
      _getInvitationsStream();

  Future<Either<NetworkFailure, Stream<List<Inviter>>>>
      _getInvitationsStream() async {
    final hasInternetConnection = await network.isConnected;
    if (hasInternetConnection) {
      final user = await local.getUser();
      final invitationsStream = db.getInvitationsStreamOnUid(user.uid);
      final invitersStream =
          invitationsStream.asyncMap<List<Inviter>>((invitations) async {
        final inviters = <Inviter>[];
        await Future.forEach<Invitation>(invitations, (invite) async {
          final inviteSender = await db.getUser(invite.senderUid);
          inviters.add(Inviter(invite, inviteSender));
        });
        return inviters;
      });
      return right(invitersStream);
    } else {
      return left(
        NetworkFailure(message: 'user dont have internet connection'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptInvitation(Invitation invitation) async {
    try {
      final user = await local.getUser();
      await db.acceptInvitation(user.uid, invitation.senderUid);
      return right(unit);
    } catch (e) {
      return left(DatabaseFailure('Cant accept invitation'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteInvitation(Invitation invitation) async {
    try {
      final user = await local.getUser();
      await db.deleteInvitation(user.uid, invitation.uid);
      return right(unit);
    } catch (e) {
      return left(DatabaseFailure('Cant delete invitation'));
    }
  }
}
