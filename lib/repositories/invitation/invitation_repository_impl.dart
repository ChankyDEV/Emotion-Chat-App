import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/data/models/core/failure.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
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
  Future<Either<NetworkFailure, Stream<List<Invitation>>>>
      get invitations async => _getInvitationsStream();

  Future<Either<NetworkFailure, Stream<List<Invitation>>>>
      _getInvitationsStream() async {
    final hasInternetConnection = await network.isConnected;
    if (hasInternetConnection) {
      final user = await local.getUser();
      return right(db.getInvitationsStreamOnUid(user.uid));
    } else {
      return left(
        NetworkFailure(message: 'user dont have internet connection'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptInvitation(Invitation invitation) {
    // TODO: implement acceptInvitation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteInvitation(Invitation invitation) {
    // TODO: implement deleteInvitation
    throw UnimplementedError();
  }
}
