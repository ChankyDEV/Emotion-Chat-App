import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/blocs/chats/chats_bloc.dart';
import 'package:emotion_chat/blocs/invitations/invitation_bloc.dart';
import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/screens/auth/additional_user_info/additional_user_info_screen.dart';
import 'package:emotion_chat/screens/main/invitations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

mixin Screens {
  static const initial = '/';
  static const authenticated = 'authenticated';
  static const unauthenticated = 'unauthenticated';
  static const additionalInfo = 'additionalInfo';
  static const invitations = 'invitations';
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
      case Screens.invitations:
        return invitations();
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
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => authCubit,
          ),
          BlocProvider(
            create: (context) => ChatsBloc(
              GetIt.I.get<InvitationRepository>(),
            )..listenOnInvitations(),
          )
        ],
        child: Authenticated(),
      ),
    );
  }

  MaterialPageRoute invitations() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => InvitationBloc(
          GetIt.I.get<InvitationRepository>(),
        )..listenOnInvitations(),
        child: Invitations(),
      ),
    );
  }
}
