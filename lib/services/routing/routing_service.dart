import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/screens/auth/additional_user_info/additional_user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screens {
  static const initial = '/';
  static const authenticated = 'authenticated';
  static const unauthenticated = 'unauthenticated';
  static const additionalInfo = 'additionalInfo';
}

class RoutingService {
  final AuthCubit authCubit;
  final AuthFormBloc authFormBloc;
  final AdditionalInfoBloc additionalInfoBloc;

  RoutingService(
    this.authCubit,
    this.authFormBloc,
    this.additionalInfoBloc,
  );

  Route? onGenerateRoute(RouteSettings routeSettings) {
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
        return wrapper();
    }
  }

  MaterialPageRoute<AdditionalUserInfoScreen> additionalInfo() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => additionalInfoBloc,
        child: AdditionalUserInfoScreen(),
      ),
    );
  }

  MaterialPageRoute<Unauthenticated> unauthenticated() {
    return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => authFormBloc
                    ..listenForLogout()
                    ..listenOnNetworkStatus(),
                ),
                BlocProvider(
                  create: (context) => AnimatedButtonCubit(
                    authFormBloc: authFormBloc,
                    authCubit: authCubit,
                  )..listenForAuthFormBlocStateChanges(),
                ),
              ],
              child: Unauthenticated(),
            ));
  }

  MaterialPageRoute<Wrapper> wrapper() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => authCubit..listenForAuthChanges(),
        child: Wrapper(),
      ),
    );
  }

  MaterialPageRoute<Authenticated> authenticated() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => authCubit,
        child: Authenticated(),
      ),
    );
  }
}
