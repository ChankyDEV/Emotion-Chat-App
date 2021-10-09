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
  final String friendUid;
  late final StreamSubscription<List<Message>> messageSub;

  ActiveChatBloc(
    this._repository,
    this.friendUid,
  ) : super(ActiveChatState.initial(
          messages: <Message>[],
          numberOfMessages: 0,
          hasError: false,
        ));

  Future<void> startListeningForMessages() async {
    final streamOrFailure =
        await _repository.getMessagesStream(messageReceiverUuid: friendUid);
    streamOrFailure.fold((f) => f, (stream) {
      messageSub = stream.listen((messages) {
        this.add(ActiveChatEvent.showMessages(messages));
      });
    });
  }

  @override
  Stream<ActiveChatState> mapEventToState(ActiveChatEvent event) async* {
    yield* event.map(showMessages: _showMessages, sendMessage: sendMessage);
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
    messageSub.cancel();
    return super.close();
  }

  Stream<ActiveChatState> sendMessage(SendMessage sendMessageEvent) async* {
    if (sendMessageEvent.message.length > 0) {
      final messageSentOrFailure = await _repository.sendMessage(
        messageContent: sendMessageEvent.message,
        messageReceiverUuid: friendUid,
      );

      messageSentOrFailure.fold((l) => l, (r) {
        print('Message has been sent');
      });
    }
  }
}
