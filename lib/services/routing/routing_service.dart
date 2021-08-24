import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/screens/auth/additional_user_info/additional_user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Screens {
  static const initial = '/';
  static const authenticated = 'authenticated';
  static const unauthenticated = 'unauthenticated';
  static const additionalInfo = 'additionalInfo';
}

class RoutingService {
  final getIt = GetIt.I;

  Route onGenerateRoute(RouteSettings routeSettings) {
    final getIt = GetIt.instance;
    switch (routeSettings.name) {
      case Screens.initial:
        return wrapper();
      case Screens.authenticated:
        return authenticated();
      case Screens.unauthenticated:
        return unauthenticated();
      case Screens.additionalInfo:
        return additionalInfo();
      default:
        return MaterialPageRoute(builder: (_) => Wrapper());
    }
  }

  MaterialPageRoute additionalInfo() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => getIt<AdditionalInfoBloc>(),
        child: AdditionalUserInfoScreen(),
      ),
    );
  }

  MaterialPageRoute unauthenticated() {
    return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
              providers: [
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
              ],
              child: Unauthenticated(),
            ));
  }

  MaterialPageRoute wrapper() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) {
          return getIt<AuthCubit>()..listenForAuthChanges();
        },
        child: Wrapper(),
      ),
    );
  }

  MaterialPageRoute authenticated() {
    return MaterialPageRoute(
      builder: (context) {
        return Authenticated();
      },
    );
  }
}
