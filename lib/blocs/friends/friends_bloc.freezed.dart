// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'friends_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FriendsEventTearOff {
  const _$FriendsEventTearOff();

  _FriendsChanged friendsChanged(List<ChatUser> friends) {
    return _FriendsChanged(
      friends,
    );
  }
}

/// @nodoc
const $FriendsEvent = _$FriendsEventTearOff();

/// @nodoc
mixin _$FriendsEvent {
  List<ChatUser> get friends => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatUser> friends) friendsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatUser> friends)? friendsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FriendsChanged value) friendsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsChanged value)? friendsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendsEventCopyWith<FriendsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsEventCopyWith<$Res> {
  factory $FriendsEventCopyWith(
          FriendsEvent value, $Res Function(FriendsEvent) then) =
      _$FriendsEventCopyWithImpl<$Res>;
  $Res call({List<ChatUser> friends});
}

/// @nodoc
class _$FriendsEventCopyWithImpl<$Res> implements $FriendsEventCopyWith<$Res> {
  _$FriendsEventCopyWithImpl(this._value, this._then);

  final FriendsEvent _value;
  // ignore: unused_field
  final $Res Function(FriendsEvent) _then;

  @override
  $Res call({
    Object? friends = freezed,
  }) {
    return _then(_value.copyWith(
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<ChatUser>,
    ));
  }
}

/// @nodoc
abstract class _$FriendsChangedCopyWith<$Res>
    implements $FriendsEventCopyWith<$Res> {
  factory _$FriendsChangedCopyWith(
          _FriendsChanged value, $Res Function(_FriendsChanged) then) =
      __$FriendsChangedCopyWithImpl<$Res>;
  @override
  $Res call({List<ChatUser> friends});
}

/// @nodoc
class __$FriendsChangedCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res>
    implements _$FriendsChangedCopyWith<$Res> {
  __$FriendsChangedCopyWithImpl(
      _FriendsChanged _value, $Res Function(_FriendsChanged) _then)
      : super(_value, (v) => _then(v as _FriendsChanged));

  @override
  _FriendsChanged get _value => super._value as _FriendsChanged;

  @override
  $Res call({
    Object? friends = freezed,
  }) {
    return _then(_FriendsChanged(
      friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<ChatUser>,
    ));
  }
}

/// @nodoc

class _$_FriendsChanged implements _FriendsChanged {
  const _$_FriendsChanged(this.friends);

  @override
  final List<ChatUser> friends;

  @override
  String toString() {
    return 'FriendsEvent.friendsChanged(friends: $friends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendsChanged &&
            (identical(other.friends, friends) ||
                const DeepCollectionEquality().equals(other.friends, friends)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(friends);

  @JsonKey(ignore: true)
  @override
  _$FriendsChangedCopyWith<_FriendsChanged> get copyWith =>
      __$FriendsChangedCopyWithImpl<_FriendsChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatUser> friends) friendsChanged,
  }) {
    return friendsChanged(friends);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatUser> friends)? friendsChanged,
    required TResult orElse(),
  }) {
    if (friendsChanged != null) {
      return friendsChanged(friends);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FriendsChanged value) friendsChanged,
  }) {
    return friendsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsChanged value)? friendsChanged,
    required TResult orElse(),
  }) {
    if (friendsChanged != null) {
      return friendsChanged(this);
    }
    return orElse();
  }
}

abstract class _FriendsChanged implements FriendsEvent {
  const factory _FriendsChanged(List<ChatUser> friends) = _$_FriendsChanged;

  @override
  List<ChatUser> get friends => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FriendsChangedCopyWith<_FriendsChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FriendsStateTearOff {
  const _$FriendsStateTearOff();

  _Initial initial({required List<ChatUser> friends}) {
    return _Initial(
      friends: friends,
    );
  }
}

/// @nodoc
const $FriendsState = _$FriendsStateTearOff();

/// @nodoc
mixin _$FriendsState {
  List<ChatUser> get friends => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatUser> friends) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatUser> friends)? initial,
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
  $FriendsStateCopyWith<FriendsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsStateCopyWith<$Res> {
  factory $FriendsStateCopyWith(
          FriendsState value, $Res Function(FriendsState) then) =
      _$FriendsStateCopyWithImpl<$Res>;
  $Res call({List<ChatUser> friends});
}

/// @nodoc
class _$FriendsStateCopyWithImpl<$Res> implements $FriendsStateCopyWith<$Res> {
  _$FriendsStateCopyWithImpl(this._value, this._then);

  final FriendsState _value;
  // ignore: unused_field
  final $Res Function(FriendsState) _then;

  @override
  $Res call({
    Object? friends = freezed,
  }) {
    return _then(_value.copyWith(
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<ChatUser>,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $FriendsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<ChatUser> friends});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$FriendsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? friends = freezed,
  }) {
    return _then(_Initial(
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<ChatUser>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.friends});

  @override
  final List<ChatUser> friends;

  @override
  String toString() {
    return 'FriendsState.initial(friends: $friends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.friends, friends) ||
                const DeepCollectionEquality().equals(other.friends, friends)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(friends);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatUser> friends) initial,
  }) {
    return initial(friends);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatUser> friends)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(friends);
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

abstract class _Initial implements FriendsState {
  const factory _Initial({required List<ChatUser> friends}) = _$_Initial;

  @override
  List<ChatUser> get friends => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
