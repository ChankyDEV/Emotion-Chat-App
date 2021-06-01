import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/screens/auth/sign_up_more_info/sign_up_more_info_screen.dart';
import 'package:emotion_chat/screens/core/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (!state.isLoading) {
          //   if (state.isLoggedIn) {
          //     state.showMoreInfoScreen
          //         ? Navigator.of(context).pushReplacementNamed('moreAuthInfo')
          //         : Navigator.of(context).pushReplacementNamed('authenticated');
          //   } else {
          //     Navigator.of(context).pushReplacementNamed('unauthenticated');
          //   }
          // }
        },
        builder: (context, state) {
          if (!state.isLoading) {
            if (state.isLoggedIn) {
              return state.showMoreInfoScreen
                  ? SignUpMoreInfoScreen()
                  : Authenticated();
            } else {
              return Unauthenticated();
            }
          } else {
            return LoadingScreen();
          }
        },
      ),
    );
  }
}
