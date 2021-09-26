import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/data/models/invitation/invitation_sender.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_bloc.freezed.dart';

part 'invitation_event.dart';

part 'invitation_state.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState> {
  final InvitationRepository _repository;
  late final StreamSubscription<List<Inviter>> _invitations;

  InvitationBloc(this._repository)
      : super(
          InvitationState.initial(
            inviters: <Inviter>[],
            numberOfInviters: 0,
          ),
        );

  void listenOnInvitations() async {
    final invitations = await _repository.invitations;
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
    final failureOrUnit = await _repository.deleteInvitation(value.invitation);
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
    final failureOrUnit = await _repository.acceptInvitation(value.invitation);
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
    await _repository.sendInvitation(e.email);
  }
}
