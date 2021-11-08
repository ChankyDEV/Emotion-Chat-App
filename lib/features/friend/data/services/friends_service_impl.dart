import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/friend/domain/entities/inviter.dart';
import 'package:emotion_chat/features/friend/domain/repositories/friends_repository.dart';
import 'package:emotion_chat/features/friend/domain/services/friends_service.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:emotion_chat/utils/data/utils/failures.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

class FriendsServiceImpl implements FriendsService {
  final FriendsRepository _friendsRepository;
  final UserRepository _userRepository;
  final LocalRepository _local;
  final NetworkInfo _network;

  FriendsServiceImpl(
    this._friendsRepository,
    this._userRepository,
    this._local,
    this._network,
  );

  @override
  Future<Either<Failure, List<ChatUser>>> getAllFriends() async {
    final hasConnection = await _network.isConnected;
    if (hasConnection) {
      try {
        final user = await _local.getUser();
        final friends = await _friendsRepository.getAllFriends(
          user.uuid,
          onFindUser: _userRepository.findUserByUuid,
        );
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

  @override
  Future<Either<Failure, Unit>> sendInvitation(String email) async {
    final hasInternetConnection = await _network.isConnected;
    if (hasInternetConnection) {
      final isUserSaved = await _local.isUserSaved();
      if (isUserSaved) {
        try {
          final receiverUuid = await _userRepository.findUserUuidByEmail(email);
          final savedUser = await _local.getUser();
          await _friendsRepository.sendInvitation(
            from: savedUser.uuid,
            to: receiverUuid,
          );
          return right(unit);
        } on ExceptionWithMessage catch (e) {
          return left(Failure(
            message: e.message,
          ));
        }
      } else {
        return left(
          Failure(message: 'Cant send invitation now'),
        );
      }
    } else {
      return left(
        Failure(message: ErrorMessages.internet.noConnection),
      );
    }
  }

  @override
  Future<Either<Failure, Stream<List<Inviter>>>> get invitations async =>
      _getInvitationsStream();

  Future<Either<Failure, Stream<List<Inviter>>>> _getInvitationsStream() async {
    final hasInternetConnection = await _network.isConnected;
    if (hasInternetConnection) {
      try {
        final user = await _local.getUser();
        final invitationsStream =
            _friendsRepository.getInvitationsStreamOnUid(user.uuid);
        final invitersStream =
            invitationsStream.asyncMap<List<Inviter>>((invitations) async {
          final inviters = <Inviter>[];
          if (invitations.length != 0) {
            await Future.forEach<Invitation>(invitations, (invite) async {
              if (invite.senderUid.isNotEmpty) {
                final inviteSender =
                    await _userRepository.getUser(invite.senderUid);
                inviters.add(Inviter(invite, inviteSender));
              }
            });
          }
          return inviters;
        });
        return right(invitersStream);
      } catch (e) {
        return left(AuthFailure(message: 'Cant remove user'));
      }
    } else {
      return left(
        NetworkFailure(message: 'user dont have internet connection'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptInvitation(Invitation invitation) async {
    try {
      final user = await _local.getUser();
      await _friendsRepository.acceptInvitation(user.uuid, invitation);
      return right(unit);
    } catch (e) {
      return left(DatabaseFailure('Cant accept invitation'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteInvitation(Invitation invitation) async {
    try {
      final user = await _local.getUser();
      await _friendsRepository.deleteInvitation(user.uuid, invitation);
      return right(unit);
    } catch (e) {
      return left(DatabaseFailure('Cant delete invitation'));
    }
  }
}
