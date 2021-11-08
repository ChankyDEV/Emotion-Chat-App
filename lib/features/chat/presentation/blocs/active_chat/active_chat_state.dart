part of 'active_chat_bloc.dart';

@freezed
class ActiveChatState with _$ActiveChatState {
  const factory ActiveChatState.initial({
    required List<Message> messages,
    required int numberOfMessages,
    required bool hasError,
    required SentimentAnalysis sentimentAnalysis,
    required Message classifiedMessage,
  }) = _Initial;
}
