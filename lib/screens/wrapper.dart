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
  final RoutingService _routingService = GetIt.I.get<RoutingService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (!state.isLoading) {
            if (state.isLoggedIn) {
              if (state.canShowMoreInfoScreen) {
                await Navigator.pushNamed(context, Screens.additionalInfo);
              } else {
                await Navigator.pushNamed(context, Screens.authenticated);
              }
            } else {
              await Navigator.pushNamed(context, Screens.unauthenticated);
            }
          }
        },
        builder: (context, state) {
          return LoadingScreen();
        },
      ),
    );
  }
}
