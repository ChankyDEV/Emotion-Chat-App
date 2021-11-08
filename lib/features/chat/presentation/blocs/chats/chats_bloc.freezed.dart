// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chats_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatsEventTearOff {
  const _$ChatsEventTearOff();

  _InvitationsNumberChanged invitationsNumberChanged(List<Inviter> invites) {
    return _InvitationsNumberChanged(
      invites,
    );
  }

  _ConversationsChanged conversationsChanged(List<Conversation> conversations) {
    return _ConversationsChanged(
      conversations,
    );
  }

  _Refresh refresh() {
    return const _Refresh();
  }

  _Reset reset() {
    return const _Reset();
  }
}

/// @nodoc
const $ChatsEvent = _$ChatsEventTearOff();

/// @nodoc
mixin _$ChatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(List<Conversation> conversations)
        conversationsChanged,
    required TResult Function() refresh,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_ConversationsChanged value) conversationsChanged,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsEventCopyWith<$Res> {
  factory $ChatsEventCopyWith(
          ChatsEvent value, $Res Function(ChatsEvent) then) =
      _$ChatsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsEventCopyWithImpl<$Res> implements $ChatsEventCopyWith<$Res> {
  _$ChatsEventCopyWithImpl(this._value, this._then);

  final ChatsEvent _value;
  // ignore: unused_field
  final $Res Function(ChatsEvent) _then;
}

/// @nodoc
abstract class _$InvitationsNumberChangedCopyWith<$Res> {
  factory _$InvitationsNumberChangedCopyWith(_InvitationsNumberChanged value,
          $Res Function(_InvitationsNumberChanged) then) =
      __$InvitationsNumberChangedCopyWithImpl<$Res>;
  $Res call({List<Inviter> invites});
}

/// @nodoc
class __$InvitationsNumberChangedCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res>
    implements _$InvitationsNumberChangedCopyWith<$Res> {
  __$InvitationsNumberChangedCopyWithImpl(_InvitationsNumberChanged _value,
      $Res Function(_InvitationsNumberChanged) _then)
      : super(_value, (v) => _then(v as _InvitationsNumberChanged));

  @override
  _InvitationsNumberChanged get _value =>
      super._value as _InvitationsNumberChanged;

  @override
  $Res call({
    Object? invites = freezed,
  }) {
    return _then(_InvitationsNumberChanged(
      invites == freezed
          ? _value.invites
          : invites // ignore: cast_nullable_to_non_nullable
              as List<Inviter>,
    ));
  }
}

/// @nodoc

class _$_InvitationsNumberChanged implements _InvitationsNumberChanged {
  const _$_InvitationsNumberChanged(this.invites);

  @override
  final List<Inviter> invites;

  @override
  String toString() {
    return 'ChatsEvent.invitationsNumberChanged(invites: $invites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvitationsNumberChanged &&
            (identical(other.invites, invites) ||
                const DeepCollectionEquality().equals(other.invites, invites)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(invites);

  @JsonKey(ignore: true)
  @override
  _$InvitationsNumberChangedCopyWith<_InvitationsNumberChanged> get copyWith =>
      __$InvitationsNumberChangedCopyWithImpl<_InvitationsNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(List<Conversation> conversations)
        conversationsChanged,
    required TResult Function() refresh,
    required TResult Function() reset,
  }) {
    return invitationsNumberChanged(invites);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
  }) {
    return invitationsNumberChanged?.call(invites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (invitationsNumberChanged != null) {
      return invitationsNumberChanged(invites);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_ConversationsChanged value) conversationsChanged,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Reset value) reset,
  }) {
    return invitationsNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
  }) {
    return invitationsNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (invitationsNumberChanged != null) {
      return invitationsNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _InvitationsNumberChanged implements ChatsEvent {
  const factory _InvitationsNumberChanged(List<Inviter> invites) =
      _$_InvitationsNumberChanged;

  List<Inviter> get invites => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$InvitationsNumberChangedCopyWith<_InvitationsNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ConversationsChangedCopyWith<$Res> {
  factory _$ConversationsChangedCopyWith(_ConversationsChanged value,
          $Res Function(_ConversationsChanged) then) =
      __$ConversationsChangedCopyWithImpl<$Res>;
  $Res call({List<Conversation> conversations});
}

/// @nodoc
class __$ConversationsChangedCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res>
    implements _$ConversationsChangedCopyWith<$Res> {
  __$ConversationsChangedCopyWithImpl(
      _ConversationsChanged _value, $Res Function(_ConversationsChanged) _then)
      : super(_value, (v) => _then(v as _ConversationsChanged));

  @override
  _ConversationsChanged get _value => super._value as _ConversationsChanged;

  @override
  $Res call({
    Object? conversations = freezed,
  }) {
    return _then(_ConversationsChanged(
      conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc

class _$_ConversationsChanged implements _ConversationsChanged {
  const _$_ConversationsChanged(this.conversations);

  @override
  final List<Conversation> conversations;

  @override
  String toString() {
    return 'ChatsEvent.conversationsChanged(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationsChanged &&
            (identical(other.conversations, conversations) ||
                const DeepCollectionEquality()
                    .equals(other.conversations, conversations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(conversations);

  @JsonKey(ignore: true)
  @override
  _$ConversationsChangedCopyWith<_ConversationsChanged> get copyWith =>
      __$ConversationsChangedCopyWithImpl<_ConversationsChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(List<Conversation> conversations)
        conversationsChanged,
    required TResult Function() refresh,
    required TResult Function() reset,
  }) {
    return conversationsChanged(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
  }) {
    return conversationsChanged?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (conversationsChanged != null) {
      return conversationsChanged(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_ConversationsChanged value) conversationsChanged,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Reset value) reset,
  }) {
    return conversationsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
  }) {
    return conversationsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (conversationsChanged != null) {
      return conversationsChanged(this);
    }
    return orElse();
  }
}

abstract class _ConversationsChanged implements ChatsEvent {
  const factory _ConversationsChanged(List<Conversation> conversations) =
      _$_ConversationsChanged;

  List<Conversation> get conversations => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ConversationsChangedCopyWith<_ConversationsChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RefreshCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) then) =
      __$RefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$RefreshCopyWithImpl<$Res> extends _$ChatsEventCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(_Refresh _value, $Res Function(_Refresh) _then)
      : super(_value, (v) => _then(v as _Refresh));

  @override
  _Refresh get _value => super._value as _Refresh;
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh();

  @override
  String toString() {
    return 'ChatsEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(List<Conversation> conversations)
        conversationsChanged,
    required TResult Function() refresh,
    required TResult Function() reset,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_ConversationsChanged value) conversationsChanged,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Reset value) reset,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements ChatsEvent {
  const factory _Refresh() = _$_Refresh;
}

/// @nodoc
abstract class _$ResetCopyWith<$Res> {
  factory _$ResetCopyWith(_Reset value, $Res Function(_Reset) then) =
      __$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetCopyWithImpl<$Res> extends _$ChatsEventCopyWithImpl<$Res>
    implements _$ResetCopyWith<$Res> {
  __$ResetCopyWithImpl(_Reset _value, $Res Function(_Reset) _then)
      : super(_value, (v) => _then(v as _Reset));

  @override
  _Reset get _value => super._value as _Reset;
}

/// @nodoc

class _$_Reset implements _Reset {
  const _$_Reset();

  @override
  String toString() {
    return 'ChatsEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(List<Conversation> conversations)
        conversationsChanged,
    required TResult Function() refresh,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(List<Conversation> conversations)? conversationsChanged,
    TResult Function()? refresh,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_ConversationsChanged value) conversationsChanged,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_ConversationsChanged value)? conversationsChanged,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements ChatsEvent {
  const factory _Reset() = _$_Reset;
}

/// @nodoc
class _$ChatsStateTearOff {
  const _$ChatsStateTearOff();

  _Initial initial(
      {required String numberOfInviters,
      required List<Inviter> inviters,
      required List<Conversation> conversations,
      required int numberOfConversations,
      required bool loading}) {
    return _Initial(
      numberOfInviters: numberOfInviters,
      inviters: inviters,
      conversations: conversations,
      numberOfConversations: numberOfConversations,
      loading: loading,
    );
  }
}

/// @nodoc
const $ChatsState = _$ChatsStateTearOff();

/// @nodoc
mixin _$ChatsState {
  String get numberOfInviters => throw _privateConstructorUsedError;
  List<Inviter> get inviters => throw _privateConstructorUsedError;
  List<Conversation> get conversations => throw _privateConstructorUsedError;
  int get numberOfConversations => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String numberOfInviters,
            List<Inviter> inviters,
            List<Conversation> conversations,
            int numberOfConversations,
            bool loading)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String numberOfInviters,
            List<Inviter> inviters,
            List<Conversation> conversations,
            int numberOfConversations,
            bool loading)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String numberOfInviters,
            List<Inviter> inviters,
            List<Conversation> conversations,
            int numberOfConversations,
            bool loading)?
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
  $ChatsStateCopyWith<ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res>;
  $Res call(
      {String numberOfInviters,
      List<Inviter> inviters,
      List<Conversation> conversations,
      int numberOfConversations,
      bool loading});
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res> implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  final ChatsState _value;
  // ignore: unused_field
  final $Res Function(ChatsState) _then;

  @override
  $Res call({
    Object? numberOfInviters = freezed,
    Object? inviters = freezed,
    Object? conversations = freezed,
    Object? numberOfConversations = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      numberOfInviters: numberOfInviters == freezed
          ? _value.numberOfInviters
          : numberOfInviters // ignore: cast_nullable_to_non_nullable
              as String,
      inviters: inviters == freezed
          ? _value.inviters
          : inviters // ignore: cast_nullable_to_non_nullable
              as List<Inviter>,
      conversations: conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
      numberOfConversations: numberOfConversations == freezed
          ? _value.numberOfConversations
          : numberOfConversations // ignore: cast_nullable_to_non_nullable
              as int,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String numberOfInviters,
      List<Inviter> inviters,
      List<Conversation> conversations,
      int numberOfConversations,
      bool loading});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ChatsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? numberOfInviters = freezed,
    Object? inviters = freezed,
    Object? conversations = freezed,
    Object? numberOfConversations = freezed,
    Object? loading = freezed,
  }) {
    return _then(_Initial(
      numberOfInviters: numberOfInviters == freezed
          ? _value.numberOfInviters
          : numberOfInviters // ignore: cast_nullable_to_non_nullable
              as String,
      inviters: inviters == freezed
          ? _value.inviters
          : inviters // ignore: cast_nullable_to_non_nullable
              as List<Inviter>,
      conversations: conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
      numberOfConversations: numberOfConversations == freezed
          ? _value.numberOfConversations
          : numberOfConversations // ignore: cast_nullable_to_non_nullable
              as int,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.numberOfInviters,
      required this.inviters,
      required this.conversations,
      required this.numberOfConversations,
      required this.loading});

  @override
  final String numberOfInviters;
  @override
  final List<Inviter> inviters;
  @override
  final List<Conversation> conversations;
  @override
  final int numberOfConversations;
  @override
  final bool loading;

  @override
  String toString() {
    return 'ChatsState.initial(numberOfInviters: $numberOfInviters, inviters: $inviters, conversations: $conversations, numberOfConversations: $numberOfConversations, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.numberOfInviters, numberOfInviters) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfInviters, numberOfInviters)) &&
            (identical(other.inviters, inviters) ||
                const DeepCollectionEquality()
                    .equals(other.inviters, inviters)) &&
            (identical(other.conversations, conversations) ||
                const DeepCollectionEquality()
                    .equals(other.conversations, conversations)) &&
            (identical(other.numberOfConversations, numberOfConversations) ||
                const DeepCollectionEquality().equals(
                    other.numberOfConversations, numberOfConversations)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numberOfInviters) ^
      const DeepCollectionEquality().hash(inviters) ^
      const DeepCollectionEquality().hash(conversations) ^
      const DeepCollectionEquality().hash(numberOfConversations) ^
      const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String numberOfInviters,
            List<Inviter> inviters,
            List<Conversation> conversations,
            int numberOfConversations,
            bool loading)
        initial,
  }) {
    return initial(numberOfInviters, inviters, conversations,
        numberOfConversations, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String numberOfInviters,
            List<Inviter> inviters,
            List<Conversation> conversations,
            int numberOfConversations,
            bool loading)?
        initial,
  }) {
    return initial?.call(numberOfInviters, inviters, conversations,
        numberOfConversations, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String numberOfInviters,
            List<Inviter> inviters,
            List<Conversation> conversations,
            int numberOfConversations,
            bool loading)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(numberOfInviters, inviters, conversations,
          numberOfConversations, loading);
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

abstract class _Initial implements ChatsState {
  const factory _Initial(
      {required String numberOfInviters,
      required List<Inviter> inviters,
      required List<Conversation> conversations,
      required int numberOfConversations,
      required bool loading}) = _$_Initial;

  @override
  String get numberOfInviters => throw _privateConstructorUsedError;
  @override
  List<Inviter> get inviters => throw _privateConstructorUsedError;
  @override
  List<Conversation> get conversations => throw _privateConstructorUsedError;
  @override
  int get numberOfConversations => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
