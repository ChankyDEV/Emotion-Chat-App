import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/data/models/invitation/invitation_sender.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_bloc.freezed.dart';

part 'chats_event.dart';

part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final InvitationRepository _invitationRepository;
  late final StreamSubscription<List<Inviter>> _invitations;

  ChatsBloc(this._invitationRepository)
      : super(
          ChatsState.initial(
            numberOfInviters: '0',
            inviters: <Inviter>[],
          ),
        );

  void listenOnInvitations() async {
    final invitations = await _invitationRepository.invitations;
    invitations.fold((l) => l, (r) {
      _invitations = r.listen((inviters) {
        this.add(ChatsEvent.invitationsNumberChanged(inviters));
      });
    });
  }

  @override
  Stream<ChatsState> mapEventToState(ChatsEvent event) async* {
    yield* event.map(
      invitationsNumberChanged: _invitationsNumberChanged,
      reset: _reset,
    );
  }

  Stream<ChatsState> _invitationsNumberChanged(
    _InvitationsNumberChanged e,
  ) async* {
    yield state.copyWith(
      numberOfInviters: e.invites.length.toString(),
      inviters: e.invites,
    );
  }

  Stream<ChatsState> _reset(_Reset value) async* {
    yield state;
  }

  @override
  Future<void> close() {
    _invitations.cancel();
    return super.close();
  }
}
