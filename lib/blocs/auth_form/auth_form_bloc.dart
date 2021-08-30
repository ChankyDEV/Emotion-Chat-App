import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/helpers/extensions.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:emotion_chat/services/network/i_network_service.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_bloc.freezed.dart';

part 'auth_form_event.dart';

part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  late final IUserRepository userRepository;
  late final AuthCubit authCubit;
  late StreamSubscription authCubitStream;
  late final INetworkService networkService;

  AuthFormBloc({
    required this.userRepository,
    required this.authCubit,
    required this.networkService,
  }) : super(AuthFormState.initial(
          emailOrPhone: EmailAddress(value: ''),
          phone: PhoneNumber(value: ''),
          password: Password(value: ''),
          showPassword: false,
          validationMode: AutovalidateMode.disabled,
          hasError: false,
          failureMessage: '',
          authRequestFinished: false,
          isPhoneNumber: false,
          hasNetworkConnection: true,
        ));

  void listenForLogout() {
    authCubitStream = authCubit.stream.listen((authState) {
      if (authState.loggedOut) {
        this.add(AuthFormEvent.resetState());
      }
    });
  }

  void listenOnNetworkStatus() {
    networkService.onNetworkStatusChange.listen((status) {
      if (status == ConnectionStatus.disconnected ||
          status == ConnectionStatus.connected) {
        this.add(AuthFormEvent.networkStatusChanged(status));
      }
    });
  }

  @override
  Future<void> close() {
    authCubitStream.cancel();
    return super.close();
  }

  @override
  Stream<AuthFormState> mapEventToState(
    AuthFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield emailOrPhoneChanged(e.input);
      },
      passwordChanged: (e) async* {
        yield state.copyWith(password: state.password.copyWith(value: e.input));
      },
      phoneChanged: (e) async* {
        yield state.copyWith(
            phone:
                state.phone.copyWith(value: e.input.removeSpacesFromString()));
      },
      clearEmailField: (e) async* {
        yield state.copyWith(emailOrPhone: EmailAddress(value: ''));
      },
      showOrHidePassword: (e) async* {
        yield state.copyWith(showPassword: !state.showPassword);
      },
      clearPhoneField: (e) async* {
        yield state.copyWith(phone: PhoneNumber(value: ''));
      },
      signUp: (e) async* {
        final failureOrUser = await userRepository.signUp(
            emailAddress: state.emailOrPhone,
            phoneNumber: state.phone,
            password: state.password);

        yield _stateFromAuthResult(failureOrUser, state);
      },
      startValidating: (e) async* {
        yield state.copyWith(validationMode: AutovalidateMode.always);
      },
      resetErrors: (e) async* {
        yield state.copyWith(hasError: false, failureMessage: '');
      },
      signIn: (e) async* {
        print(state.emailOrPhone.value);
        final failureOrUser = state.emailOrPhone.isValid()
            ? await userRepository.signInWithEmail(
                emailAddress: state.emailOrPhone, password: state.password)
            : await userRepository.signInWithPhoneNumber(
                phoneNumber: PhoneNumber(value: state.emailOrPhone.value),
                password: state.password);
        yield _stateFromAuthResult(failureOrUser, state);
      },
      resetState: (e) async* {
        yield AuthFormState.initial(
            emailOrPhone: EmailAddress(value: ''),
            phone: PhoneNumber(value: ''),
            password: Password(value: ''),
            showPassword: false,
            validationMode: AutovalidateMode.disabled,
            hasError: false,
            failureMessage: '',
            authRequestFinished: false,
            isPhoneNumber: false,
            hasNetworkConnection: true);
      },
      networkStatusChanged: (e) async* {
        if (e.status == ConnectionStatus.connected) {
          yield state.copyWith(hasNetworkConnection: true);
        } else if (e.status == ConnectionStatus.disconnected) {
          yield state.copyWith(hasNetworkConnection: false);
        }
      },
    );
  }

  AuthFormState _stateFromAuthResult(
      Either<Failure, MyUser> result, AuthFormState state) {
    if (result.isLeft()) {
      var failure;
      result.fold((l) => failure = l, (_) => _);
      return state.copyWith(
          hasError: true,
          failureMessage: failure.message,
          authRequestFinished: true);
    } else {
      return state.copyWith(hasError: false, authRequestFinished: true);
    }
  }

  AuthFormState emailOrPhoneChanged(String input) {
    String emailOrPhone = input.removeSpacesFromString();
    if (int.tryParse(emailOrPhone) != null) {
      return state.copyWith(
          emailOrPhone: state.emailOrPhone.copyWith(value: emailOrPhone),
          isPhoneNumber: true);
    } else {
      return state.copyWith(
          emailOrPhone: state.emailOrPhone.copyWith(value: emailOrPhone),
          isPhoneNumber: false);
    }
  }
}
