import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  late final IUserRepository authRepository;
  late StreamSubscription _authStream;

  AuthCubit({required this.authRepository})
      : super(
          AuthState.initial(
            isLoggedIn: false,
            areInputsWrong: false,
            showMoreInfoScreen: false,
            isLoading: true,
            loggedOut: false,
          ),
        );

  void logout() async {
    final isLoggedOut = await authRepository.logout();
    emit(state.copyWith(loggedOut: isLoggedOut));
  }

  Future<void> checkAuthStatus() async {
    await authRepository.checkIfUserIsLoggedIn();
  }

  void listenForAuthChanges() async {
    _authStream = authRepository.currentUser!.stream.listen((user) {
      if (_userLoggedIn(user)) {
        if (_userLoggedForTheFirstTime(user)) {
          _showMoreInfoScreen();
        } else {
          _showAuthenticatedScreen();
        }
      } else {
        _showUnauthenticatedScreen();
      }
      _turnOffLoadingScreen();
    });
    await checkAuthStatus();
  }

  bool _userLoggedIn(User user) {
    return user != User.empty() ? true : false;
  }

  bool _userLoggedForTheFirstTime(User user) {
    return user.name.value == '' ? true : false;
  }

  void _showMoreInfoScreen() {
    emit(state.copyWith(
        showMoreInfoScreen: true, isLoggedIn: true, loggedOut: false));
  }

  void _showAuthenticatedScreen() {
    emit(state.copyWith(
        showMoreInfoScreen: false, isLoggedIn: true, loggedOut: false));
  }

  void _showUnauthenticatedScreen() {
    emit(state.copyWith(isLoggedIn: false, showMoreInfoScreen: false));
  }

  void _turnOffLoadingScreen() {
    emit(state.copyWith(isLoading: false));
  }

  @override
  Future<void> close() {
    _authStream.cancel();
    return super.close();
  }
}
