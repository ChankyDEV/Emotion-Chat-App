part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.invitationsNumberChanged(List<Inviter> invites) =
      _InvitationsNumberChanged;

  const factory ChatsEvent.reset() = _Reset;
}
