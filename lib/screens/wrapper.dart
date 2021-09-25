import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/screens/core/loading_screen.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (!state.isLoading) {
            if (state.isLoggedIn) {
              if (state.canShowMoreInfoScreen) {
                Navigator.of(context).pushReplacementNamed(
                  Screens.additionalInfo,
                );
              } else {
                Navigator.of(context).pushReplacementNamed(
                  Screens.authenticated,
                );
              }
            } else {
              Navigator.of(context).pushReplacementNamed(
                Screens.unauthenticated,
              );
            }
          }
        },
        child: LoadingScreen(),
      ),
    );
  }
}
