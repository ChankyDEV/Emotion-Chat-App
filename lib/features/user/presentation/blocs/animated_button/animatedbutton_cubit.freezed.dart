// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'animatedbutton_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnimatedButtonStateTearOff {
  const _$AnimatedButtonStateTearOff();

  _Initial initial(
      {required bool isPressed,
      required bool isDisabled,
      required bool isProcessing}) {
    return _Initial(
      isPressed: isPressed,
      isDisabled: isDisabled,
      isProcessing: isProcessing,
    );
  }
}

/// @nodoc
const $AnimatedButtonState = _$AnimatedButtonStateTearOff();

/// @nodoc
mixin _$AnimatedButtonState {
  bool get isPressed => throw _privateConstructorUsedError;
  bool get isDisabled => throw _privateConstructorUsedError;
  bool get isProcessing => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isPressed, bool isDisabled, bool isProcessing)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPressed, bool isDisabled, bool isProcessing)?
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimatedButtonStateCopyWith<AnimatedButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimatedButtonStateCopyWith<$Res> {
  factory $AnimatedButtonStateCopyWith(
          AnimatedButtonState value, $Res Function(AnimatedButtonState) then) =
      _$AnimatedButtonStateCopyWithImpl<$Res>;
  $Res call({bool isPressed, bool isDisabled, bool isProcessing});
}

/// @nodoc
class _$AnimatedButtonStateCopyWithImpl<$Res>
    implements $AnimatedButtonStateCopyWith<$Res> {
  _$AnimatedButtonStateCopyWithImpl(this._value, this._then);

  final AnimatedButtonState _value;
  // ignore: unused_field
  final $Res Function(AnimatedButtonState) _then;

  @override
  $Res call({
    Object? isPressed = freezed,
    Object? isDisabled = freezed,
    Object? isProcessing = freezed,
  }) {
    return _then(_value.copyWith(
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisabled: isDisabled == freezed
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessing: isProcessing == freezed
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $AnimatedButtonStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool isPressed, bool isDisabled, bool isProcessing});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AnimatedButtonStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? isPressed = freezed,
    Object? isDisabled = freezed,
    Object? isProcessing = freezed,
  }) {
    return _then(_Initial(
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisabled: isDisabled == freezed
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessing: isProcessing == freezed
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isPressed,
      required this.isDisabled,
      required this.isProcessing});

  @override
  final bool isPressed;
  @override
  final bool isDisabled;
  @override
  final bool isProcessing;

  @override
  String toString() {
    return 'AnimatedButtonState.initial(isPressed: $isPressed, isDisabled: $isDisabled, isProcessing: $isProcessing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.isPressed, isPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isPressed, isPressed)) &&
            (identical(other.isDisabled, isDisabled) ||
                const DeepCollectionEquality()
                    .equals(other.isDisabled, isDisabled)) &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isPressed) ^
      const DeepCollectionEquality().hash(isDisabled) ^
      const DeepCollectionEquality().hash(isProcessing);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isPressed, bool isDisabled, bool isProcessing)
        initial,
  }) {
    return initial(isPressed, isDisabled, isProcessing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPressed, bool isDisabled, bool isProcessing)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isPressed, isDisabled, isProcessing);
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

abstract class _Initial implements AnimatedButtonState {
  const factory _Initial(
      {required bool isPressed,
      required bool isDisabled,
      required bool isProcessing}) = _$_Initial;

  @override
  bool get isPressed => throw _privateConstructorUsedError;
  @override
  bool get isDisabled => throw _privateConstructorUsedError;
  @override
  bool get isProcessing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
