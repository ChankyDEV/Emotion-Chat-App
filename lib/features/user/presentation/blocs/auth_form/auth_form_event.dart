part of 'auth_form_bloc.dart';

@freezed
abstract class AuthFormEvent with _$AuthFormEvent {
  const factory AuthFormEvent.emailChanged(String input) = _EmailChanged;
  const factory AuthFormEvent.phoneChanged(String input) = _PhoneChanged;
  const factory AuthFormEvent.passwordChanged(String input) = _PasswordChanged;
  const factory AuthFormEvent.clearEmailField() = _ClearEmailField;
  const factory AuthFormEvent.clearPhoneField() = _ClearPhoneField;
  const factory AuthFormEvent.showOrHidePassword() = _ShowOrHidePassword;
  const factory AuthFormEvent.signUp() = _SignUp;
  const factory AuthFormEvent.signIn() = _SignIn;
  const factory AuthFormEvent.startValidating() = _StartValidating;
  const factory AuthFormEvent.resetErrors() = _ResetErrors;
  const factory AuthFormEvent.resetState() = _ResetState;
  const factory AuthFormEvent.networkStatusChanged(ConnectionStatus status) =
      _NetworkStatusChanged;
}
