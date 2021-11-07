import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/friend/domain/entities/inviter.dart';
import 'package:emotion_chat/features/friend/domain/services/friends_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_bloc.freezed.dart';
part 'invitation_event.dart';
part 'invitation_state.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState> {
  final FriendsService _service;
  late final StreamSubscription<List<Inviter>> _invitations;

  InvitationBloc(this._service)
      : super(
          InvitationState.initial(
            inviters: <Inviter>[],
            numberOfInviters: 0,
          ),
        );

  void listenOnInvitations() async {
    final invitations = await _service.invitations;
    invitations.fold((l) => l, (r) {
      _invitations = r.listen((inviters) {
        this.add(
          InvitationEvent.invitationsNumberChanged(inviters),
        );
      });
    });
  }

  @override
  Stream<InvitationState> mapEventToState(InvitationEvent event) async* {
    yield* event.map(
      accept: _accept,
      delete: _delete,
      invitationsNumberChanged: _invitationsNumberChanged,
      sendInvitation: _sendInvitation,
    );
  }

  Stream<InvitationState> _invitationsNumberChanged(
    _InvitationsNumberChanged e,
  ) async* {
    yield state.copyWith(
      numberOfInviters: e.invites.length,
      inviters: e.invites,
    );
  }

  Stream<InvitationState> _delete(_DeleteInvitation value) async* {
    final failureOrUnit = await _service.deleteInvitation(value.invitation);
    yield failureOrUnit.fold<InvitationState>((_) => state, (r) {
      state.inviters.removeWhere(
        (element) => element.invitation.senderUid == value.invitation.senderUid,
      );
      return state.copyWith(
        numberOfInviters: state.numberOfInviters - 1,
        inviters: state.inviters,
      );
    });
  }

  Stream<InvitationState> _accept(_AcceptInvitation value) async* {
    final failureOrUnit = await _service.acceptInvitation(value.invitation);
    yield failureOrUnit.fold<InvitationState>((_) => state, (r) {
      state.inviters.removeWhere(
        (element) => element.invitation.senderUid == value.invitation.senderUid,
      );
      return state.copyWith(
        numberOfInviters: state.numberOfInviters - 1,
        inviters: state.inviters,
      );
    });
  }

  @override
  Future<void> close() {
    _invitations.cancel();
    return super.close();
  }

  Stream<InvitationState> _sendInvitation(_SendInvitation e) async* {
    await _service.sendInvitation(e.email);
  }
}
