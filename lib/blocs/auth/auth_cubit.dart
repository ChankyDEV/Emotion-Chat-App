import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository authRepository;

  AuthCubit({required this.authRepository})
      : super(
          AuthState.initial(
            isLoggedIn: false,
            areInputsWrong: false,
            canShowMoreInfoScreen: false,
            isLoading: true,
            loggedOut: false,
          ),
        );

  void logout() async {
    final isLoggedOut = await authRepository.logout();
    emit(
      state.copyWith(loggedOut: isLoggedOut),
    );
  }

  Future<void> checkAuthStatus() async {
    await authRepository.checkIfUserIsLoggedIn();
  }

  void listenForAuthChanges() async {
    authRepository.currentUser.listen((user) {
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

  bool _userLoggedIn(ChatUser user) {
    return user != ChatUser.empty() ? true : false;
  }

  bool _userLoggedForTheFirstTime(ChatUser user) {
    return user.name.value == '' ? true : false;
  }

  void _showMoreInfoScreen() {
    emit(
      state.copyWith(
        canShowMoreInfoScreen: true,
        isLoggedIn: true,
        loggedOut: false,
      ),
    );
  }

  void _showAuthenticatedScreen() {
    emit(
      state.copyWith(
        canShowMoreInfoScreen: false,
        isLoggedIn: true,
        loggedOut: false,
      ),
    );
  }

  void _showUnauthenticatedScreen() {
    emit(
      state.copyWith(
        isLoggedIn: false,
        canShowMoreInfoScreen: false,
      ),
    );
  }

  void _turnOffLoadingScreen() {
    emit(
      state.copyWith(isLoading: false),
    );
  }
}
