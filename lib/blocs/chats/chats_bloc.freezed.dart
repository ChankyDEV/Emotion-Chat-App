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

  _InvitationsNumberChanged invitationsNumberChanged(List<Inviter> invites) {
    return _InvitationsNumberChanged(
      invites,
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
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
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
    required TResult Function() reset,
  }) {
    return invitationsNumberChanged(invites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
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
  const factory _InvitationsNumberChanged(List<Inviter> invites) =
      _$_InvitationsNumberChanged;

  List<Inviter> get invites => throw _privateConstructorUsedError;
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
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
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

  _Initial initial(
      {required String numberOfInviters, required List<Inviter> inviters}) {
    return _Initial(
      numberOfInviters: numberOfInviters,
      inviters: inviters,
    );
  }
}

/// @nodoc
const $ChatsState = _$ChatsStateTearOff();

/// @nodoc
mixin _$ChatsState {
  String get numberOfInviters => throw _privateConstructorUsedError;
  List<Inviter> get inviters => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String numberOfInviters, List<Inviter> inviters)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInviters, List<Inviter> inviters)? initial,
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
  $Res call({String numberOfInviters, List<Inviter> inviters});
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
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({String numberOfInviters, List<Inviter> inviters});
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
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.numberOfInviters, required this.inviters});

  @override
  final String numberOfInviters;
  @override
  final List<Inviter> inviters;

  @override
  String toString() {
    return 'ChatsState.initial(numberOfInviters: $numberOfInviters, inviters: $inviters)';
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
                    .equals(other.inviters, inviters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numberOfInviters) ^
      const DeepCollectionEquality().hash(inviters);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String numberOfInviters, List<Inviter> inviters)
        initial,
  }) {
    return initial(numberOfInviters, inviters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String numberOfInviters, List<Inviter> inviters)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(numberOfInviters, inviters);
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
  const factory _Initial(
      {required String numberOfInviters,
      required List<Inviter> inviters}) = _$_Initial;

  @override
  String get numberOfInviters => throw _privateConstructorUsedError;
  @override
  List<Inviter> get inviters => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
