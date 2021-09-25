part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.initial({
    required String numberOfInvitation,
  }) = _Initial;
}
