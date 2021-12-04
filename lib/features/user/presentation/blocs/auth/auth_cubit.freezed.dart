// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _Initial initial(
      {required bool isLoggedIn,
      required bool areInputsWrong,
      required bool canShowMoreInfoScreen,
      required bool isLoading,
      required bool loggedOut}) {
    return _Initial(
      isLoggedIn: isLoggedIn,
      areInputsWrong: areInputsWrong,
      canShowMoreInfoScreen: canShowMoreInfoScreen,
      isLoading: isLoading,
      loggedOut: loggedOut,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  bool get areInputsWrong => throw _privateConstructorUsedError;
  bool get canShowMoreInfoScreen => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get loggedOut => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoggedIn, bool areInputsWrong,
            bool canShowMoreInfoScreen, bool isLoading, bool loggedOut)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoggedIn, bool areInputsWrong,
            bool canShowMoreInfoScreen, bool isLoading, bool loggedOut)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoggedIn, bool areInputsWrong,
            bool canShowMoreInfoScreen, bool isLoading, bool loggedOut)?
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
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoggedIn,
      bool areInputsWrong,
      bool canShowMoreInfoScreen,
      bool isLoading,
      bool loggedOut});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? areInputsWrong = freezed,
    Object? canShowMoreInfoScreen = freezed,
    Object? isLoading = freezed,
    Object? loggedOut = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      areInputsWrong: areInputsWrong == freezed
          ? _value.areInputsWrong
          : areInputsWrong // ignore: cast_nullable_to_non_nullable
              as bool,
      canShowMoreInfoScreen: canShowMoreInfoScreen == freezed
          ? _value.canShowMoreInfoScreen
          : canShowMoreInfoScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loggedOut: loggedOut == freezed
          ? _value.loggedOut
          : loggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoggedIn,
      bool areInputsWrong,
      bool canShowMoreInfoScreen,
      bool isLoading,
      bool loggedOut});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? areInputsWrong = freezed,
    Object? canShowMoreInfoScreen = freezed,
    Object? isLoading = freezed,
    Object? loggedOut = freezed,
  }) {
    return _then(_Initial(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      areInputsWrong: areInputsWrong == freezed
          ? _value.areInputsWrong
          : areInputsWrong // ignore: cast_nullable_to_non_nullable
              as bool,
      canShowMoreInfoScreen: canShowMoreInfoScreen == freezed
          ? _value.canShowMoreInfoScreen
          : canShowMoreInfoScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loggedOut: loggedOut == freezed
          ? _value.loggedOut
          : loggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isLoggedIn,
      required this.areInputsWrong,
      required this.canShowMoreInfoScreen,
      required this.isLoading,
      required this.loggedOut});

  @override
  final bool isLoggedIn;
  @override
  final bool areInputsWrong;
  @override
  final bool canShowMoreInfoScreen;
  @override
  final bool isLoading;
  @override
  final bool loggedOut;

  @override
  String toString() {
    return 'AuthState.initial(isLoggedIn: $isLoggedIn, areInputsWrong: $areInputsWrong, canShowMoreInfoScreen: $canShowMoreInfoScreen, isLoading: $isLoading, loggedOut: $loggedOut)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isLoggedIn, isLoggedIn)) &&
            (identical(other.areInputsWrong, areInputsWrong) ||
                const DeepCollectionEquality()
                    .equals(other.areInputsWrong, areInputsWrong)) &&
            (identical(other.canShowMoreInfoScreen, canShowMoreInfoScreen) ||
                const DeepCollectionEquality().equals(
                    other.canShowMoreInfoScreen, canShowMoreInfoScreen)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.loggedOut, loggedOut) ||
                const DeepCollectionEquality()
                    .equals(other.loggedOut, loggedOut)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoggedIn) ^
      const DeepCollectionEquality().hash(areInputsWrong) ^
      const DeepCollectionEquality().hash(canShowMoreInfoScreen) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(loggedOut);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoggedIn, bool areInputsWrong,
            bool canShowMoreInfoScreen, bool isLoading, bool loggedOut)
        initial,
  }) {
    return initial(isLoggedIn, areInputsWrong, canShowMoreInfoScreen, isLoading,
        loggedOut);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoggedIn, bool areInputsWrong,
            bool canShowMoreInfoScreen, bool isLoading, bool loggedOut)?
        initial,
  }) {
    return initial?.call(isLoggedIn, areInputsWrong, canShowMoreInfoScreen,
        isLoading, loggedOut);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoggedIn, bool areInputsWrong,
            bool canShowMoreInfoScreen, bool isLoading, bool loggedOut)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoggedIn, areInputsWrong, canShowMoreInfoScreen,
          isLoading, loggedOut);
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

abstract class _Initial implements AuthState {
  const factory _Initial(
      {required bool isLoggedIn,
      required bool areInputsWrong,
      required bool canShowMoreInfoScreen,
      required bool isLoading,
      required bool loggedOut}) = _$_Initial;

  @override
  bool get isLoggedIn => throw _privateConstructorUsedError;
  @override
  bool get areInputsWrong => throw _privateConstructorUsedError;
  @override
  bool get canShowMoreInfoScreen => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get loggedOut => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
