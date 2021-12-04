import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth_form/auth_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animatedbutton_cubit.freezed.dart';
part 'animatedbutton_state.dart';

class AnimatedButtonCubit extends Cubit<AnimatedButtonState> {
  late StreamSubscription authFormStream;
  late StreamSubscription authCubitStream;
  late final AuthFormBloc authFormBloc;
  late final AuthCubit authCubit;

  AnimatedButtonCubit({required this.authFormBloc, required this.authCubit})
      : super(AnimatedButtonState.initial(
          isDisabled: false,
          isPressed: false,
          isProcessing: false,
        ));

  void listenForAuthFormBlocStateChanges() {
    authFormStream = authFormBloc.stream.listen((authFormState) {
      if (authFormState.authRequestFinished) {
        release();
      }
    });
    authCubitStream = authCubit.stream.listen((authState) {
      if (authState.loggedOut) {
        release();
      }
    });
  }

  void clicked() {
    if (!state.isProcessing) {
      emit(
        state.copyWith(
          isPressed: true,
          isProcessing: true,
        ),
      );
    } else {}
  }

  void release() {
    emit(
      state.copyWith(isPressed: false, isProcessing: false),
    );
  }

  @override
  Future<void> close() {
    authFormStream.cancel();
    authCubitStream.cancel();
    return super.close();
  }
}
