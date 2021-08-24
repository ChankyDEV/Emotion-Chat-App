part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial(
      {required bool isLoggedIn,
      required bool areInputsWrong,
      required bool canShowMoreInfoScreen,
      required bool isLoading,
      required bool loggedOut}) = _Initial;
}
