import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/features/chat/domain/entities/message.dart';
import 'package:emotion_chat/features/chat/domain/services/chat_service.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis_result.dart';
import 'package:emotion_chat/features/classification/domain/services/classification_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_chat_bloc.freezed.dart';
part 'active_chat_event.dart';
part 'active_chat_state.dart';

class ActiveChatBloc extends Bloc<ActiveChatEvent, ActiveChatState> {
  final ChatService _chatService;
  final ClassificationService _classificationService;
  final String _friendUid;
  late StreamSubscription<List<Message>> _messageSub;
  int limit = 20;

  ActiveChatBloc(
    this._chatService,
    this._classificationService,
    this._friendUid,
  ) : super(
          ActiveChatState.initial(
            messages: <Message>[],
            numberOfMessages: 0,
            hasError: false,
            sentimentAnalysis: SentimentAnalysis.empty(),
            classifiedMessage: Message.empty(),
          ),
        );

  Future<void> startListeningForMessages(int? newLimit) async {
    final streamOrFailure = await _chatService.getMessagesStream(
      messageReceiverUuid: _friendUid,
      limit: newLimit ?? limit,
    );
    streamOrFailure.fold((f) => f, (stream) {
      _messageSub = stream.listen((messages) {
        this.add(ActiveChatEvent.showMessages(messages));
      });
    });
  }

  @override
  Stream<ActiveChatState> mapEventToState(ActiveChatEvent event) async* {
    yield* event.map(
      showMessages: _showMessages,
      sendMessage: sendMessage,
      onScrollToEnd: onScrollToEnd,
      onMessageTap: onMessageTap,
    );
  }

  Stream<ActiveChatState> _showMessages(
    ShowMessages value,
  ) async* {
    yield state.copyWith(
      messages: value.messages,
      numberOfMessages: value.messages.length,
    );
  }

  @override
  Future<void> close() {
    _messageSub.cancel();
    return super.close();
  }

  Stream<ActiveChatState> sendMessage(SendMessage sendMessageEvent) async* {
    if (sendMessageEvent.message.length > 0) {
      final messageSentOrFailure = await _chatService.sendMessage(
        messageContent: sendMessageEvent.message,
        messageReceiverUuid: _friendUid,
      );

      messageSentOrFailure.fold((l) => l, (r) {
        print('Message has been sent');
      });
    }
  }

  Stream<ActiveChatState> onScrollToEnd(OnScrollToEnd value) async* {
    await _messageSub.cancel();
    await startListeningForMessages(limit += 20);
  }

  Stream<ActiveChatState> onMessageTap(OnMessageTap value) async* {
    if (state.sentimentAnalysis.result == SentimentAnalysisResult.none) {
      final failureOrResult = await _classificationService
          .getSentimentAnalysis(value.message.content);
      yield failureOrResult.fold<ActiveChatState>(
        (l) => state,
        (r) => onClassification(r, value.message),
      );
      yield state.copyWith(
        sentimentAnalysis: SentimentAnalysis.empty(),
        classifiedMessage: Message.empty(),
      );
    }
  }

  ActiveChatState onClassification(
    SentimentAnalysis analysis,
    Message message,
  ) {
    return state.copyWith(
      sentimentAnalysis: analysis,
      classifiedMessage: message,
    );
  }
}
