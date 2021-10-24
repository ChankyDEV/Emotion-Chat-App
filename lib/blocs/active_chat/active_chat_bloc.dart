import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/data/models/conversation/message.dart';
import 'package:emotion_chat/repositories/chat/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_chat_bloc.freezed.dart';
part 'active_chat_event.dart';
part 'active_chat_state.dart';

class ActiveChatBloc extends Bloc<ActiveChatEvent, ActiveChatState> {
  final ChatRepository _repository;
  final String _friendUid;
  late StreamSubscription<List<Message>> _messageSub;
  int limit = 20;

  ActiveChatBloc(
    this._repository,
    this._friendUid,
  ) : super(
          ActiveChatState.initial(
            messages: <Message>[],
            numberOfMessages: 0,
            hasError: false,
          ),
        );

  Future<void> startListeningForMessages(int? newLimit) async {
    final streamOrFailure = await _repository.getMessagesStream(
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
      final messageSentOrFailure = await _repository.sendMessage(
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
}
