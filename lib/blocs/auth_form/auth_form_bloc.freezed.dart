// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFormEventTearOff {
  const _$AuthFormEventTearOff();

  _EmailChanged emailChanged(String input) {
    return _EmailChanged(
      input,
    );
  }

  _PhoneChanged phoneChanged(String input) {
    return _PhoneChanged(
      input,
    );
  }

  _PasswordChanged passwordChanged(String input) {
    return _PasswordChanged(
      input,
    );
  }

  _ClearEmailField clearEmailField() {
    return const _ClearEmailField();
  }

  _ClearPhoneField clearPhoneField() {
    return const _ClearPhoneField();
  }

  _ShowOrHidePassword showOrHidePassword() {
    return const _ShowOrHidePassword();
  }

  _SignUp signUp() {
    return const _SignUp();
  }

  _SignIn signIn() {
    return const _SignIn();
  }

  _StartValidating startValidating() {
    return const _StartValidating();
  }

  _ResetErrors resetErrors() {
    return const _ResetErrors();
  }

  _ResetState resetState() {
    return const _ResetState();
  }

  _NetworkStatusChanged networkStatusChanged(ConnectionStatus status) {
    return _NetworkStatusChanged(
      status,
    );
  }
}

/// @nodoc
const $AuthFormEvent = _$AuthFormEventTearOff();

/// @nodoc
mixin _$AuthFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormEventCopyWith<$Res> {
  factory $AuthFormEventCopyWith(
          AuthFormEvent value, $Res Function(AuthFormEvent) then) =
      _$AuthFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthFormEventCopyWith<$Res> {
  _$AuthFormEventCopyWithImpl(this._value, this._then);

  final AuthFormEvent _value;
  // ignore: unused_field
  final $Res Function(AuthFormEvent) _then;
}

/// @nodoc
abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class __$EmailChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(
      _EmailChanged _value, $Res Function(_EmailChanged) _then)
      : super(_value, (v) => _then(v as _EmailChanged));

  @override
  _EmailChanged get _value => super._value as _EmailChanged;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_EmailChanged(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'AuthFormEvent.emailChanged(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailChanged &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(input);

  @JsonKey(ignore: true)
  @override
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return emailChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements AuthFormEvent {
  const factory _EmailChanged(String input) = _$_EmailChanged;

  String get input => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PhoneChangedCopyWith<$Res> {
  factory _$PhoneChangedCopyWith(
          _PhoneChanged value, $Res Function(_PhoneChanged) then) =
      __$PhoneChangedCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class __$PhoneChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$PhoneChangedCopyWith<$Res> {
  __$PhoneChangedCopyWithImpl(
      _PhoneChanged _value, $Res Function(_PhoneChanged) _then)
      : super(_value, (v) => _then(v as _PhoneChanged));

  @override
  _PhoneChanged get _value => super._value as _PhoneChanged;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_PhoneChanged(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhoneChanged implements _PhoneChanged {
  const _$_PhoneChanged(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'AuthFormEvent.phoneChanged(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneChanged &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(input);

  @JsonKey(ignore: true)
  @override
  _$PhoneChangedCopyWith<_PhoneChanged> get copyWith =>
      __$PhoneChangedCopyWithImpl<_PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return phoneChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class _PhoneChanged implements AuthFormEvent {
  const factory _PhoneChanged(String input) = _$_PhoneChanged;

  String get input => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PhoneChangedCopyWith<_PhoneChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PasswordChangedCopyWith<$Res> {
  factory _$PasswordChangedCopyWith(
          _PasswordChanged value, $Res Function(_PasswordChanged) then) =
      __$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class __$PasswordChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$PasswordChangedCopyWith<$Res> {
  __$PasswordChangedCopyWithImpl(
      _PasswordChanged _value, $Res Function(_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _PasswordChanged));

  @override
  _PasswordChanged get _value => super._value as _PasswordChanged;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_PasswordChanged(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'AuthFormEvent.passwordChanged(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordChanged &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(input);

  @JsonKey(ignore: true)
  @override
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith =>
      __$PasswordChangedCopyWithImpl<_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return passwordChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements AuthFormEvent {
  const factory _PasswordChanged(String input) = _$_PasswordChanged;

  String get input => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ClearEmailFieldCopyWith<$Res> {
  factory _$ClearEmailFieldCopyWith(
          _ClearEmailField value, $Res Function(_ClearEmailField) then) =
      __$ClearEmailFieldCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearEmailFieldCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$ClearEmailFieldCopyWith<$Res> {
  __$ClearEmailFieldCopyWithImpl(
      _ClearEmailField _value, $Res Function(_ClearEmailField) _then)
      : super(_value, (v) => _then(v as _ClearEmailField));

  @override
  _ClearEmailField get _value => super._value as _ClearEmailField;
}

/// @nodoc

class _$_ClearEmailField implements _ClearEmailField {
  const _$_ClearEmailField();

  @override
  String toString() {
    return 'AuthFormEvent.clearEmailField()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ClearEmailField);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return clearEmailField();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (clearEmailField != null) {
      return clearEmailField();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return clearEmailField(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (clearEmailField != null) {
      return clearEmailField(this);
    }
    return orElse();
  }
}

abstract class _ClearEmailField implements AuthFormEvent {
  const factory _ClearEmailField() = _$_ClearEmailField;
}

/// @nodoc
abstract class _$ClearPhoneFieldCopyWith<$Res> {
  factory _$ClearPhoneFieldCopyWith(
          _ClearPhoneField value, $Res Function(_ClearPhoneField) then) =
      __$ClearPhoneFieldCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearPhoneFieldCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$ClearPhoneFieldCopyWith<$Res> {
  __$ClearPhoneFieldCopyWithImpl(
      _ClearPhoneField _value, $Res Function(_ClearPhoneField) _then)
      : super(_value, (v) => _then(v as _ClearPhoneField));

  @override
  _ClearPhoneField get _value => super._value as _ClearPhoneField;
}

/// @nodoc

class _$_ClearPhoneField implements _ClearPhoneField {
  const _$_ClearPhoneField();

  @override
  String toString() {
    return 'AuthFormEvent.clearPhoneField()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ClearPhoneField);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return clearPhoneField();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (clearPhoneField != null) {
      return clearPhoneField();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return clearPhoneField(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (clearPhoneField != null) {
      return clearPhoneField(this);
    }
    return orElse();
  }
}

abstract class _ClearPhoneField implements AuthFormEvent {
  const factory _ClearPhoneField() = _$_ClearPhoneField;
}

/// @nodoc
abstract class _$ShowOrHidePasswordCopyWith<$Res> {
  factory _$ShowOrHidePasswordCopyWith(
          _ShowOrHidePassword value, $Res Function(_ShowOrHidePassword) then) =
      __$ShowOrHidePasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$ShowOrHidePasswordCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$ShowOrHidePasswordCopyWith<$Res> {
  __$ShowOrHidePasswordCopyWithImpl(
      _ShowOrHidePassword _value, $Res Function(_ShowOrHidePassword) _then)
      : super(_value, (v) => _then(v as _ShowOrHidePassword));

  @override
  _ShowOrHidePassword get _value => super._value as _ShowOrHidePassword;
}

/// @nodoc

class _$_ShowOrHidePassword implements _ShowOrHidePassword {
  const _$_ShowOrHidePassword();

  @override
  String toString() {
    return 'AuthFormEvent.showOrHidePassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ShowOrHidePassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return showOrHidePassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (showOrHidePassword != null) {
      return showOrHidePassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return showOrHidePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (showOrHidePassword != null) {
      return showOrHidePassword(this);
    }
    return orElse();
  }
}

abstract class _ShowOrHidePassword implements AuthFormEvent {
  const factory _ShowOrHidePassword() = _$_ShowOrHidePassword;
}

/// @nodoc
abstract class _$SignUpCopyWith<$Res> {
  factory _$SignUpCopyWith(_SignUp value, $Res Function(_SignUp) then) =
      __$SignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignUpCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$SignUpCopyWith<$Res> {
  __$SignUpCopyWithImpl(_SignUp _value, $Res Function(_SignUp) _then)
      : super(_value, (v) => _then(v as _SignUp));

  @override
  _SignUp get _value => super._value as _SignUp;
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp();

  @override
  String toString() {
    return 'AuthFormEvent.signUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return signUp();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements AuthFormEvent {
  const factory _SignUp() = _$_SignUp;
}

/// @nodoc
abstract class _$SignInCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) then) =
      __$SignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(_SignIn _value, $Res Function(_SignIn) _then)
      : super(_value, (v) => _then(v as _SignIn));

  @override
  _SignIn get _value => super._value as _SignIn;
}

/// @nodoc

class _$_SignIn implements _SignIn {
  const _$_SignIn();

  @override
  String toString() {
    return 'AuthFormEvent.signIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return signIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements AuthFormEvent {
  const factory _SignIn() = _$_SignIn;
}

/// @nodoc
abstract class _$StartValidatingCopyWith<$Res> {
  factory _$StartValidatingCopyWith(
          _StartValidating value, $Res Function(_StartValidating) then) =
      __$StartValidatingCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartValidatingCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$StartValidatingCopyWith<$Res> {
  __$StartValidatingCopyWithImpl(
      _StartValidating _value, $Res Function(_StartValidating) _then)
      : super(_value, (v) => _then(v as _StartValidating));

  @override
  _StartValidating get _value => super._value as _StartValidating;
}

/// @nodoc

class _$_StartValidating implements _StartValidating {
  const _$_StartValidating();

  @override
  String toString() {
    return 'AuthFormEvent.startValidating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _StartValidating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return startValidating();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (startValidating != null) {
      return startValidating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return startValidating(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (startValidating != null) {
      return startValidating(this);
    }
    return orElse();
  }
}

abstract class _StartValidating implements AuthFormEvent {
  const factory _StartValidating() = _$_StartValidating;
}

/// @nodoc
abstract class _$ResetErrorsCopyWith<$Res> {
  factory _$ResetErrorsCopyWith(
          _ResetErrors value, $Res Function(_ResetErrors) then) =
      __$ResetErrorsCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetErrorsCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$ResetErrorsCopyWith<$Res> {
  __$ResetErrorsCopyWithImpl(
      _ResetErrors _value, $Res Function(_ResetErrors) _then)
      : super(_value, (v) => _then(v as _ResetErrors));

  @override
  _ResetErrors get _value => super._value as _ResetErrors;
}

/// @nodoc

class _$_ResetErrors implements _ResetErrors {
  const _$_ResetErrors();

  @override
  String toString() {
    return 'AuthFormEvent.resetErrors()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ResetErrors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return resetErrors();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (resetErrors != null) {
      return resetErrors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return resetErrors(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (resetErrors != null) {
      return resetErrors(this);
    }
    return orElse();
  }
}

abstract class _ResetErrors implements AuthFormEvent {
  const factory _ResetErrors() = _$_ResetErrors;
}

/// @nodoc
abstract class _$ResetStateCopyWith<$Res> {
  factory _$ResetStateCopyWith(
          _ResetState value, $Res Function(_ResetState) then) =
      __$ResetStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetStateCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$ResetStateCopyWith<$Res> {
  __$ResetStateCopyWithImpl(
      _ResetState _value, $Res Function(_ResetState) _then)
      : super(_value, (v) => _then(v as _ResetState));

  @override
  _ResetState get _value => super._value as _ResetState;
}

/// @nodoc

class _$_ResetState implements _ResetState {
  const _$_ResetState();

  @override
  String toString() {
    return 'AuthFormEvent.resetState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ResetState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements AuthFormEvent {
  const factory _ResetState() = _$_ResetState;
}

/// @nodoc
abstract class _$NetworkStatusChangedCopyWith<$Res> {
  factory _$NetworkStatusChangedCopyWith(_NetworkStatusChanged value,
          $Res Function(_NetworkStatusChanged) then) =
      __$NetworkStatusChangedCopyWithImpl<$Res>;
  $Res call({ConnectionStatus status});
}

/// @nodoc
class __$NetworkStatusChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$NetworkStatusChangedCopyWith<$Res> {
  __$NetworkStatusChangedCopyWithImpl(
      _NetworkStatusChanged _value, $Res Function(_NetworkStatusChanged) _then)
      : super(_value, (v) => _then(v as _NetworkStatusChanged));

  @override
  _NetworkStatusChanged get _value => super._value as _NetworkStatusChanged;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_NetworkStatusChanged(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
    ));
  }
}

/// @nodoc

class _$_NetworkStatusChanged implements _NetworkStatusChanged {
  const _$_NetworkStatusChanged(this.status);

  @override
  final ConnectionStatus status;

  @override
  String toString() {
    return 'AuthFormEvent.networkStatusChanged(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NetworkStatusChanged &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$NetworkStatusChangedCopyWith<_NetworkStatusChanged> get copyWith =>
      __$NetworkStatusChangedCopyWithImpl<_NetworkStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) emailChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function(String input) passwordChanged,
    required TResult Function() clearEmailField,
    required TResult Function() clearPhoneField,
    required TResult Function() showOrHidePassword,
    required TResult Function() signUp,
    required TResult Function() signIn,
    required TResult Function() startValidating,
    required TResult Function() resetErrors,
    required TResult Function() resetState,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
  }) {
    return networkStatusChanged(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? emailChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function(String input)? passwordChanged,
    TResult Function()? clearEmailField,
    TResult Function()? clearPhoneField,
    TResult Function()? showOrHidePassword,
    TResult Function()? signUp,
    TResult Function()? signIn,
    TResult Function()? startValidating,
    TResult Function()? resetErrors,
    TResult Function()? resetState,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (networkStatusChanged != null) {
      return networkStatusChanged(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ClearEmailField value) clearEmailField,
    required TResult Function(_ClearPhoneField value) clearPhoneField,
    required TResult Function(_ShowOrHidePassword value) showOrHidePassword,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_StartValidating value) startValidating,
    required TResult Function(_ResetErrors value) resetErrors,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_NetworkStatusChanged value) networkStatusChanged,
  }) {
    return networkStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ClearEmailField value)? clearEmailField,
    TResult Function(_ClearPhoneField value)? clearPhoneField,
    TResult Function(_ShowOrHidePassword value)? showOrHidePassword,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_StartValidating value)? startValidating,
    TResult Function(_ResetErrors value)? resetErrors,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_NetworkStatusChanged value)? networkStatusChanged,
    required TResult orElse(),
  }) {
    if (networkStatusChanged != null) {
      return networkStatusChanged(this);
    }
    return orElse();
  }
}

abstract class _NetworkStatusChanged implements AuthFormEvent {
  const factory _NetworkStatusChanged(ConnectionStatus status) =
      _$_NetworkStatusChanged;

  ConnectionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NetworkStatusChangedCopyWith<_NetworkStatusChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthFormStateTearOff {
  const _$AuthFormStateTearOff();

  _Initial initial(
      {required EmailAddress emailOrPhone,
      required PhoneNumber phone,
      required Password password,
      required bool showPassword,
      required AutovalidateMode validationMode,
      required bool hasError,
      required String failureMessage,
      required bool authRequestFinished,
      required bool isPhoneNumber,
      required bool hasNetworkConnection}) {
    return _Initial(
      emailOrPhone: emailOrPhone,
      phone: phone,
      password: password,
      showPassword: showPassword,
      validationMode: validationMode,
      hasError: hasError,
      failureMessage: failureMessage,
      authRequestFinished: authRequestFinished,
      isPhoneNumber: isPhoneNumber,
      hasNetworkConnection: hasNetworkConnection,
    );
  }
}

/// @nodoc
const $AuthFormState = _$AuthFormStateTearOff();

/// @nodoc
mixin _$AuthFormState {
  EmailAddress get emailOrPhone => throw _privateConstructorUsedError;
  PhoneNumber get phone => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  AutovalidateMode get validationMode => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get failureMessage => throw _privateConstructorUsedError;
  bool get authRequestFinished => throw _privateConstructorUsedError;
  bool get isPhoneNumber => throw _privateConstructorUsedError;
  bool get hasNetworkConnection => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EmailAddress emailOrPhone,
            PhoneNumber phone,
            Password password,
            bool showPassword,
            AutovalidateMode validationMode,
            bool hasError,
            String failureMessage,
            bool authRequestFinished,
            bool isPhoneNumber,
            bool hasNetworkConnection)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            EmailAddress emailOrPhone,
            PhoneNumber phone,
            Password password,
            bool showPassword,
            AutovalidateMode validationMode,
            bool hasError,
            String failureMessage,
            bool authRequestFinished,
            bool isPhoneNumber,
            bool hasNetworkConnection)?
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
  $AuthFormStateCopyWith<AuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormStateCopyWith<$Res> {
  factory $AuthFormStateCopyWith(
          AuthFormState value, $Res Function(AuthFormState) then) =
      _$AuthFormStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailOrPhone,
      PhoneNumber phone,
      Password password,
      bool showPassword,
      AutovalidateMode validationMode,
      bool hasError,
      String failureMessage,
      bool authRequestFinished,
      bool isPhoneNumber,
      bool hasNetworkConnection});
}

/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._value, this._then);

  final AuthFormState _value;
  // ignore: unused_field
  final $Res Function(AuthFormState) _then;

  @override
  $Res call({
    Object? emailOrPhone = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? showPassword = freezed,
    Object? validationMode = freezed,
    Object? hasError = freezed,
    Object? failureMessage = freezed,
    Object? authRequestFinished = freezed,
    Object? isPhoneNumber = freezed,
    Object? hasNetworkConnection = freezed,
  }) {
    return _then(_value.copyWith(
      emailOrPhone: emailOrPhone == freezed
          ? _value.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      validationMode: validationMode == freezed
          ? _value.validationMode
          : validationMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      failureMessage: failureMessage == freezed
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
      authRequestFinished: authRequestFinished == freezed
          ? _value.authRequestFinished
          : authRequestFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumber: isPhoneNumber == freezed
          ? _value.isPhoneNumber
          : isPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNetworkConnection: hasNetworkConnection == freezed
          ? _value.hasNetworkConnection
          : hasNetworkConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $AuthFormStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailOrPhone,
      PhoneNumber phone,
      Password password,
      bool showPassword,
      AutovalidateMode validationMode,
      bool hasError,
      String failureMessage,
      bool authRequestFinished,
      bool isPhoneNumber,
      bool hasNetworkConnection});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AuthFormStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? emailOrPhone = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? showPassword = freezed,
    Object? validationMode = freezed,
    Object? hasError = freezed,
    Object? failureMessage = freezed,
    Object? authRequestFinished = freezed,
    Object? isPhoneNumber = freezed,
    Object? hasNetworkConnection = freezed,
  }) {
    return _then(_Initial(
      emailOrPhone: emailOrPhone == freezed
          ? _value.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      validationMode: validationMode == freezed
          ? _value.validationMode
          : validationMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      failureMessage: failureMessage == freezed
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
      authRequestFinished: authRequestFinished == freezed
          ? _value.authRequestFinished
          : authRequestFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumber: isPhoneNumber == freezed
          ? _value.isPhoneNumber
          : isPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNetworkConnection: hasNetworkConnection == freezed
          ? _value.hasNetworkConnection
          : hasNetworkConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.emailOrPhone,
      required this.phone,
      required this.password,
      required this.showPassword,
      required this.validationMode,
      required this.hasError,
      required this.failureMessage,
      required this.authRequestFinished,
      required this.isPhoneNumber,
      required this.hasNetworkConnection});

  @override
  final EmailAddress emailOrPhone;
  @override
  final PhoneNumber phone;
  @override
  final Password password;
  @override
  final bool showPassword;
  @override
  final AutovalidateMode validationMode;
  @override
  final bool hasError;
  @override
  final String failureMessage;
  @override
  final bool authRequestFinished;
  @override
  final bool isPhoneNumber;
  @override
  final bool hasNetworkConnection;

  @override
  String toString() {
    return 'AuthFormState.initial(emailOrPhone: $emailOrPhone, phone: $phone, password: $password, showPassword: $showPassword, validationMode: $validationMode, hasError: $hasError, failureMessage: $failureMessage, authRequestFinished: $authRequestFinished, isPhoneNumber: $isPhoneNumber, hasNetworkConnection: $hasNetworkConnection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.emailOrPhone, emailOrPhone) ||
                const DeepCollectionEquality()
                    .equals(other.emailOrPhone, emailOrPhone)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.showPassword, showPassword) ||
                const DeepCollectionEquality()
                    .equals(other.showPassword, showPassword)) &&
            (identical(other.validationMode, validationMode) ||
                const DeepCollectionEquality()
                    .equals(other.validationMode, validationMode)) &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)) &&
            (identical(other.failureMessage, failureMessage) ||
                const DeepCollectionEquality()
                    .equals(other.failureMessage, failureMessage)) &&
            (identical(other.authRequestFinished, authRequestFinished) ||
                const DeepCollectionEquality()
                    .equals(other.authRequestFinished, authRequestFinished)) &&
            (identical(other.isPhoneNumber, isPhoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.isPhoneNumber, isPhoneNumber)) &&
            (identical(other.hasNetworkConnection, hasNetworkConnection) ||
                const DeepCollectionEquality()
                    .equals(other.hasNetworkConnection, hasNetworkConnection)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailOrPhone) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(showPassword) ^
      const DeepCollectionEquality().hash(validationMode) ^
      const DeepCollectionEquality().hash(hasError) ^
      const DeepCollectionEquality().hash(failureMessage) ^
      const DeepCollectionEquality().hash(authRequestFinished) ^
      const DeepCollectionEquality().hash(isPhoneNumber) ^
      const DeepCollectionEquality().hash(hasNetworkConnection);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EmailAddress emailOrPhone,
            PhoneNumber phone,
            Password password,
            bool showPassword,
            AutovalidateMode validationMode,
            bool hasError,
            String failureMessage,
            bool authRequestFinished,
            bool isPhoneNumber,
            bool hasNetworkConnection)
        initial,
  }) {
    return initial(
        emailOrPhone,
        phone,
        password,
        showPassword,
        validationMode,
        hasError,
        failureMessage,
        authRequestFinished,
        isPhoneNumber,
        hasNetworkConnection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            EmailAddress emailOrPhone,
            PhoneNumber phone,
            Password password,
            bool showPassword,
            AutovalidateMode validationMode,
            bool hasError,
            String failureMessage,
            bool authRequestFinished,
            bool isPhoneNumber,
            bool hasNetworkConnection)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          emailOrPhone,
          phone,
          password,
          showPassword,
          validationMode,
          hasError,
          failureMessage,
          authRequestFinished,
          isPhoneNumber,
          hasNetworkConnection);
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

abstract class _Initial implements AuthFormState {
  const factory _Initial(
      {required EmailAddress emailOrPhone,
      required PhoneNumber phone,
      required Password password,
      required bool showPassword,
      required AutovalidateMode validationMode,
      required bool hasError,
      required String failureMessage,
      required bool authRequestFinished,
      required bool isPhoneNumber,
      required bool hasNetworkConnection}) = _$_Initial;

  @override
  EmailAddress get emailOrPhone => throw _privateConstructorUsedError;
  @override
  PhoneNumber get phone => throw _privateConstructorUsedError;
  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  bool get showPassword => throw _privateConstructorUsedError;
  @override
  AutovalidateMode get validationMode => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  String get failureMessage => throw _privateConstructorUsedError;
  @override
  bool get authRequestFinished => throw _privateConstructorUsedError;
  @override
  bool get isPhoneNumber => throw _privateConstructorUsedError;
  @override
  bool get hasNetworkConnection => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
