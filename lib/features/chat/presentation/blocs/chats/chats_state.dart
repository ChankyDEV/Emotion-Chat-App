part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.initial({
    required String numberOfInviters,
    required List<Inviter> inviters,
    required List<Conversation> conversations,
    required int numberOfConversations,
    required bool loading,
  }) = _Initial;
}
