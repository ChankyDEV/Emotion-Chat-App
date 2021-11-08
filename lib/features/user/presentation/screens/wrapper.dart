import 'package:emotion_chat/features/routing/routing_service.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/utils/presentation/core/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                await Navigator.of(context).pushNamed(
                  Screens.additionalInfo,
                );
              } else {
                await Navigator.of(context).pushNamed(
                  Screens.authenticated,
                );
              }
            } else {
              await Navigator.of(context).pushNamed(
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
