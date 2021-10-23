part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.invitationsNumberChanged(List<Inviter> invites) =
      _InvitationsNumberChanged;

  const factory ChatsEvent.conversationsChanged(
      List<Conversation> conversations) = _ConversationsChanged;

  const factory ChatsEvent.refresh() = _Refresh;

  const factory ChatsEvent.reset() = _Reset;
}
