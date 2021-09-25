// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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

  _InvitationsNumberChanged invitationsNumberChanged(
      String numberOfInvitations) {
    return _InvitationsNumberChanged(
      numberOfInvitations,
    );
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
    required TResult Function(String numberOfInvitations)
        invitationsNumberChanged,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInvitations)? invitationsNumberChanged,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
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
  $Res call({String numberOfInvitations});
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
    Object? numberOfInvitations = freezed,
  }) {
    return _then(_InvitationsNumberChanged(
      numberOfInvitations == freezed
          ? _value.numberOfInvitations
          : numberOfInvitations // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InvitationsNumberChanged implements _InvitationsNumberChanged {
  const _$_InvitationsNumberChanged(this.numberOfInvitations);

  @override
  final String numberOfInvitations;

  @override
  String toString() {
    return 'ChatsEvent.invitationsNumberChanged(numberOfInvitations: $numberOfInvitations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvitationsNumberChanged &&
            (identical(other.numberOfInvitations, numberOfInvitations) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfInvitations, numberOfInvitations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numberOfInvitations);

  @JsonKey(ignore: true)
  @override
  _$InvitationsNumberChangedCopyWith<_InvitationsNumberChanged> get copyWith =>
      __$InvitationsNumberChangedCopyWithImpl<_InvitationsNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String numberOfInvitations)
        invitationsNumberChanged,
    required TResult Function() reset,
  }) {
    return invitationsNumberChanged(numberOfInvitations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInvitations)? invitationsNumberChanged,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (invitationsNumberChanged != null) {
      return invitationsNumberChanged(numberOfInvitations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_Reset value) reset,
  }) {
    return invitationsNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
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
  const factory _InvitationsNumberChanged(String numberOfInvitations) =
      _$_InvitationsNumberChanged;

  String get numberOfInvitations => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$InvitationsNumberChangedCopyWith<_InvitationsNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(String numberOfInvitations)
        invitationsNumberChanged,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInvitations)? invitationsNumberChanged,
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
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
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

  _Initial initial({required String numberOfInvitation}) {
    return _Initial(
      numberOfInvitation: numberOfInvitation,
    );
  }
}

/// @nodoc
const $ChatsState = _$ChatsStateTearOff();

/// @nodoc
mixin _$ChatsState {
  String get numberOfInvitation => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String numberOfInvitation) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInvitation)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
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
  $Res call({String numberOfInvitation});
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res> implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  final ChatsState _value;
  // ignore: unused_field
  final $Res Function(ChatsState) _then;

  @override
  $Res call({
    Object? numberOfInvitation = freezed,
  }) {
    return _then(_value.copyWith(
      numberOfInvitation: numberOfInvitation == freezed
          ? _value.numberOfInvitation
          : numberOfInvitation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({String numberOfInvitation});
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
    Object? numberOfInvitation = freezed,
  }) {
    return _then(_Initial(
      numberOfInvitation: numberOfInvitation == freezed
          ? _value.numberOfInvitation
          : numberOfInvitation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.numberOfInvitation});

  @override
  final String numberOfInvitation;

  @override
  String toString() {
    return 'ChatsState.initial(numberOfInvitation: $numberOfInvitation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.numberOfInvitation, numberOfInvitation) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfInvitation, numberOfInvitation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numberOfInvitation);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String numberOfInvitation) initial,
  }) {
    return initial(numberOfInvitation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInvitation)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(numberOfInvitation);
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
  const factory _Initial({required String numberOfInvitation}) = _$_Initial;

  @override
  String get numberOfInvitation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
