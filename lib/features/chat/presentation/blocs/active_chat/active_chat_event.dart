part of 'active_chat_bloc.dart';

@freezed
class ActiveChatEvent with _$ActiveChatEvent {
  const factory ActiveChatEvent.showMessages(
    List<Message> messages,
  ) = ShowMessages;

  const factory ActiveChatEvent.sendMessage(String message) = SendMessage;

  const factory ActiveChatEvent.onMessageTap(Message message) = OnMessageTap;

  const factory ActiveChatEvent.onScrollToEnd() = OnScrollToEnd;

  const factory ActiveChatEvent.onEndClassifing() = OnEndClassifing;
}
