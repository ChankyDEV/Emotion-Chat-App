part of 'auth_form_bloc.dart';

@freezed
abstract class AuthFormState with _$AuthFormState {
  const factory AuthFormState.initial({
    required EmailAddress emailOrPhone,
    required PhoneNumber phone,
    required Password password,
    required bool showPassword,
    required AutovalidateMode validationMode,
    required bool hasError,
    required String failureMessage,
    required bool authRequestFinished,
    required bool isPhoneNumber,
    required bool hasNetworkConnection,
  }) = _Initial;
}
