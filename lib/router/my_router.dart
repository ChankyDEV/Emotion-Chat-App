import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/screens/auth/additional_user_info/additional_user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final getIt = GetIt.instance;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) {
                return getIt<AuthCubit>()..listenForAuthChanges();
              },
            ),
            BlocProvider(
              create: (context) => getIt<AdditionalInfoBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<AuthFormBloc>()
                ..listenForLogout()
                ..listenOnNetworkStatus(),
            ),
            BlocProvider(
              create: (context) => AnimatedButtonCubit(
                  authFormBloc: getIt<AuthFormBloc>(),
                  authCubit: getIt<AuthCubit>())
                ..listenForAuthFormBlocStateChanges(),
            ),
          ], child: Wrapper()),
        );
      case 'authenticated':
        return MaterialPageRoute(
          builder: (context) {
            return Authenticated();
          },
        );
      case 'unauthenticated':
        return MaterialPageRoute(
          builder: (context) {
            return Unauthenticated();
          },
        );
      case 'additionalInfo':
        return MaterialPageRoute(builder: (context) {
          return AdditionalUserInfoScreen();
        });
      default:
        return MaterialPageRoute(builder: (_) => Wrapper());
    }
  }
}
