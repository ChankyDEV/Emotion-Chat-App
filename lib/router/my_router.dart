import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injectable_init.dart';

class MyRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
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
                    create: (context) => getIt<MoreInfoFormBloc>(),
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
                ], child: Wrapper()));
        break;
      case 'moreAuthInfo':
        return MaterialPageRoute(
          builder: (context) {
            return SignUpMoreInfoScreen();
          },
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
      default:
        return MaterialPageRoute(builder: (_) => Wrapper());
    }
  }
}
