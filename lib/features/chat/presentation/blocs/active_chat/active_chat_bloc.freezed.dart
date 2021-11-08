// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'active_chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ActiveChatEventTearOff {
  const _$ActiveChatEventTearOff();

  ShowMessages showMessages(List<Message> messages) {
    return ShowMessages(
      messages,
    );
  }

  SendMessage sendMessage(String message) {
    return SendMessage(
      message,
    );
  }

  OnMessageTap onMessageTap(Message message) {
    return OnMessageTap(
      message,
    );
  }

  OnScrollToEnd onScrollToEnd() {
    return const OnScrollToEnd();
  }
}

/// @nodoc
const $ActiveChatEvent = _$ActiveChatEventTearOff();

/// @nodoc
mixin _$ActiveChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Message> messages) showMessages,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) onMessageTap,
    required TResult Function() onScrollToEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessages value) showMessages,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(OnMessageTap value) onMessageTap,
    required TResult Function(OnScrollToEnd value) onScrollToEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveChatEventCopyWith<$Res> {
  factory $ActiveChatEventCopyWith(
          ActiveChatEvent value, $Res Function(ActiveChatEvent) then) =
      _$ActiveChatEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ActiveChatEventCopyWithImpl<$Res>
    implements $ActiveChatEventCopyWith<$Res> {
  _$ActiveChatEventCopyWithImpl(this._value, this._then);

  final ActiveChatEvent _value;
  // ignore: unused_field
  final $Res Function(ActiveChatEvent) _then;
}

/// @nodoc
abstract class $ShowMessagesCopyWith<$Res> {
  factory $ShowMessagesCopyWith(
          ShowMessages value, $Res Function(ShowMessages) then) =
      _$ShowMessagesCopyWithImpl<$Res>;
  $Res call({List<Message> messages});
}

/// @nodoc
class _$ShowMessagesCopyWithImpl<$Res>
    extends _$ActiveChatEventCopyWithImpl<$Res>
    implements $ShowMessagesCopyWith<$Res> {
  _$ShowMessagesCopyWithImpl(
      ShowMessages _value, $Res Function(ShowMessages) _then)
      : super(_value, (v) => _then(v as ShowMessages));

  @override
  ShowMessages get _value => super._value as ShowMessages;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(ShowMessages(
      messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$ShowMessages implements ShowMessages {
  const _$ShowMessages(this.messages);

  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'ActiveChatEvent.showMessages(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowMessages &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  $ShowMessagesCopyWith<ShowMessages> get copyWith =>
      _$ShowMessagesCopyWithImpl<ShowMessages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Message> messages) showMessages,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) onMessageTap,
    required TResult Function() onScrollToEnd,
  }) {
    return showMessages(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
  }) {
    return showMessages?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (showMessages != null) {
      return showMessages(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessages value) showMessages,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(OnMessageTap value) onMessageTap,
    required TResult Function(OnScrollToEnd value) onScrollToEnd,
  }) {
    return showMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
  }) {
    return showMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (showMessages != null) {
      return showMessages(this);
    }
    return orElse();
  }
}

abstract class ShowMessages implements ActiveChatEvent {
  const factory ShowMessages(List<Message> messages) = _$ShowMessages;

  List<Message> get messages => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowMessagesCopyWith<ShowMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageCopyWith<$Res> {
  factory $SendMessageCopyWith(
          SendMessage value, $Res Function(SendMessage) then) =
      _$SendMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    extends _$ActiveChatEventCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(
      SendMessage _value, $Res Function(SendMessage) _then)
      : super(_value, (v) => _then(v as SendMessage));

  @override
  SendMessage get _value => super._value as SendMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(SendMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessage implements SendMessage {
  const _$SendMessage(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ActiveChatEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $SendMessageCopyWith<SendMessage> get copyWith =>
      _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Message> messages) showMessages,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) onMessageTap,
    required TResult Function() onScrollToEnd,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessages value) showMessages,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(OnMessageTap value) onMessageTap,
    required TResult Function(OnScrollToEnd value) onScrollToEnd,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessage implements ActiveChatEvent {
  const factory SendMessage(String message) = _$SendMessage;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMessageCopyWith<SendMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnMessageTapCopyWith<$Res> {
  factory $OnMessageTapCopyWith(
          OnMessageTap value, $Res Function(OnMessageTap) then) =
      _$OnMessageTapCopyWithImpl<$Res>;
  $Res call({Message message});
}

/// @nodoc
class _$OnMessageTapCopyWithImpl<$Res>
    extends _$ActiveChatEventCopyWithImpl<$Res>
    implements $OnMessageTapCopyWith<$Res> {
  _$OnMessageTapCopyWithImpl(
      OnMessageTap _value, $Res Function(OnMessageTap) _then)
      : super(_value, (v) => _then(v as OnMessageTap));

  @override
  OnMessageTap get _value => super._value as OnMessageTap;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(OnMessageTap(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc

class _$OnMessageTap implements OnMessageTap {
  const _$OnMessageTap(this.message);

  @override
  final Message message;

  @override
  String toString() {
    return 'ActiveChatEvent.onMessageTap(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OnMessageTap &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $OnMessageTapCopyWith<OnMessageTap> get copyWith =>
      _$OnMessageTapCopyWithImpl<OnMessageTap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Message> messages) showMessages,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) onMessageTap,
    required TResult Function() onScrollToEnd,
  }) {
    return onMessageTap(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
  }) {
    return onMessageTap?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (onMessageTap != null) {
      return onMessageTap(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessages value) showMessages,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(OnMessageTap value) onMessageTap,
    required TResult Function(OnScrollToEnd value) onScrollToEnd,
  }) {
    return onMessageTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
  }) {
    return onMessageTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (onMessageTap != null) {
      return onMessageTap(this);
    }
    return orElse();
  }
}

abstract class OnMessageTap implements ActiveChatEvent {
  const factory OnMessageTap(Message message) = _$OnMessageTap;

  Message get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnMessageTapCopyWith<OnMessageTap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnScrollToEndCopyWith<$Res> {
  factory $OnScrollToEndCopyWith(
          OnScrollToEnd value, $Res Function(OnScrollToEnd) then) =
      _$OnScrollToEndCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnScrollToEndCopyWithImpl<$Res>
    extends _$ActiveChatEventCopyWithImpl<$Res>
    implements $OnScrollToEndCopyWith<$Res> {
  _$OnScrollToEndCopyWithImpl(
      OnScrollToEnd _value, $Res Function(OnScrollToEnd) _then)
      : super(_value, (v) => _then(v as OnScrollToEnd));

  @override
  OnScrollToEnd get _value => super._value as OnScrollToEnd;
}

/// @nodoc

class _$OnScrollToEnd implements OnScrollToEnd {
  const _$OnScrollToEnd();

  @override
  String toString() {
    return 'ActiveChatEvent.onScrollToEnd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OnScrollToEnd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Message> messages) showMessages,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) onMessageTap,
    required TResult Function() onScrollToEnd,
  }) {
    return onScrollToEnd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
  }) {
    return onScrollToEnd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Message> messages)? showMessages,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? onMessageTap,
    TResult Function()? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (onScrollToEnd != null) {
      return onScrollToEnd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessages value) showMessages,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(OnMessageTap value) onMessageTap,
    required TResult Function(OnScrollToEnd value) onScrollToEnd,
  }) {
    return onScrollToEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
  }) {
    return onScrollToEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessages value)? showMessages,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(OnMessageTap value)? onMessageTap,
    TResult Function(OnScrollToEnd value)? onScrollToEnd,
    required TResult orElse(),
  }) {
    if (onScrollToEnd != null) {
      return onScrollToEnd(this);
    }
    return orElse();
  }
}

abstract class OnScrollToEnd implements ActiveChatEvent {
  const factory OnScrollToEnd() = _$OnScrollToEnd;
}

/// @nodoc
class _$ActiveChatStateTearOff {
  const _$ActiveChatStateTearOff();

  _Initial initial(
      {required List<Message> messages,
      required int numberOfMessages,
      required bool hasError,
      required SentimentAnalysis sentimentAnalysis,
      required Message classifiedMessage}) {
    return _Initial(
      messages: messages,
      numberOfMessages: numberOfMessages,
      hasError: hasError,
      sentimentAnalysis: sentimentAnalysis,
      classifiedMessage: classifiedMessage,
    );
  }
}

/// @nodoc
const $ActiveChatState = _$ActiveChatStateTearOff();

/// @nodoc
mixin _$ActiveChatState {
  List<Message> get messages => throw _privateConstructorUsedError;
  int get numberOfMessages => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  SentimentAnalysis get sentimentAnalysis => throw _privateConstructorUsedError;
  Message get classifiedMessage => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Message> messages,
            int numberOfMessages,
            bool hasError,
            SentimentAnalysis sentimentAnalysis,
            Message classifiedMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<Message> messages,
            int numberOfMessages,
            bool hasError,
            SentimentAnalysis sentimentAnalysis,
            Message classifiedMessage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Message> messages,
            int numberOfMessages,
            bool hasError,
            SentimentAnalysis sentimentAnalysis,
            Message classifiedMessage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActiveChatStateCopyWith<ActiveChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveChatStateCopyWith<$Res> {
  factory $ActiveChatStateCopyWith(
          ActiveChatState value, $Res Function(ActiveChatState) then) =
      _$ActiveChatStateCopyWithImpl<$Res>;
  $Res call(
      {List<Message> messages,
      int numberOfMessages,
      bool hasError,
      SentimentAnalysis sentimentAnalysis,
      Message classifiedMessage});
}

/// @nodoc
class _$ActiveChatStateCopyWithImpl<$Res>
    implements $ActiveChatStateCopyWith<$Res> {
  _$ActiveChatStateCopyWithImpl(this._value, this._then);

  final ActiveChatState _value;
  // ignore: unused_field
  final $Res Function(ActiveChatState) _then;

  @override
  $Res call({
    Object? messages = freezed,
    Object? numberOfMessages = freezed,
    Object? hasError = freezed,
    Object? sentimentAnalysis = freezed,
    Object? classifiedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      numberOfMessages: numberOfMessages == freezed
          ? _value.numberOfMessages
          : numberOfMessages // ignore: cast_nullable_to_non_nullable
              as int,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      sentimentAnalysis: sentimentAnalysis == freezed
          ? _value.sentimentAnalysis
          : sentimentAnalysis // ignore: cast_nullable_to_non_nullable
              as SentimentAnalysis,
      classifiedMessage: classifiedMessage == freezed
          ? _value.classifiedMessage
          : classifiedMessage // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $ActiveChatStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Message> messages,
      int numberOfMessages,
      bool hasError,
      SentimentAnalysis sentimentAnalysis,
      Message classifiedMessage});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ActiveChatStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? messages = freezed,
    Object? numberOfMessages = freezed,
    Object? hasError = freezed,
    Object? sentimentAnalysis = freezed,
    Object? classifiedMessage = freezed,
  }) {
    return _then(_Initial(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      numberOfMessages: numberOfMessages == freezed
          ? _value.numberOfMessages
          : numberOfMessages // ignore: cast_nullable_to_non_nullable
              as int,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      sentimentAnalysis: sentimentAnalysis == freezed
          ? _value.sentimentAnalysis
          : sentimentAnalysis // ignore: cast_nullable_to_non_nullable
              as SentimentAnalysis,
      classifiedMessage: classifiedMessage == freezed
          ? _value.classifiedMessage
          : classifiedMessage // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.messages,
      required this.numberOfMessages,
      required this.hasError,
      required this.sentimentAnalysis,
      required this.classifiedMessage});

  @override
  final List<Message> messages;
  @override
  final int numberOfMessages;
  @override
  final bool hasError;
  @override
  final SentimentAnalysis sentimentAnalysis;
  @override
  final Message classifiedMessage;

  @override
  String toString() {
    return 'ActiveChatState.initial(messages: $messages, numberOfMessages: $numberOfMessages, hasError: $hasError, sentimentAnalysis: $sentimentAnalysis, classifiedMessage: $classifiedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.numberOfMessages, numberOfMessages) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfMessages, numberOfMessages)) &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)) &&
            (identical(other.sentimentAnalysis, sentimentAnalysis) ||
                const DeepCollectionEquality()
                    .equals(other.sentimentAnalysis, sentimentAnalysis)) &&
            (identical(other.classifiedMessage, classifiedMessage) ||
                const DeepCollectionEquality()
                    .equals(other.classifiedMessage, classifiedMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(numberOfMessages) ^
      const DeepCollectionEquality().hash(hasError) ^
      const DeepCollectionEquality().hash(sentimentAnalysis) ^
      const DeepCollectionEquality().hash(classifiedMessage);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Message> messages,
            int numberOfMessages,
            bool hasError,
            SentimentAnalysis sentimentAnalysis,
            Message classifiedMessage)
        initial,
  }) {
    return initial(messages, numberOfMessages, hasError, sentimentAnalysis,
        classifiedMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<Message> messages,
            int numberOfMessages,
            bool hasError,
            SentimentAnalysis sentimentAnalysis,
            Message classifiedMessage)?
        initial,
  }) {
    return initial?.call(messages, numberOfMessages, hasError,
        sentimentAnalysis, classifiedMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Message> messages,
            int numberOfMessages,
            bool hasError,
            SentimentAnalysis sentimentAnalysis,
            Message classifiedMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(messages, numberOfMessages, hasError, sentimentAnalysis,
          classifiedMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ActiveChatState {
  const factory _Initial(
      {required List<Message> messages,
      required int numberOfMessages,
      required bool hasError,
      required SentimentAnalysis sentimentAnalysis,
      required Message classifiedMessage}) = _$_Initial;

  @override
  List<Message> get messages => throw _privateConstructorUsedError;
  @override
  int get numberOfMessages => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  SentimentAnalysis get sentimentAnalysis => throw _privateConstructorUsedError;
  @override
  Message get classifiedMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
