import 'package:emotion_chat/blocs/active_chat/active_chat_bloc.dart';
import 'package:emotion_chat/blocs/animated_button/animatedbutton_cubit.dart';
import 'package:emotion_chat/blocs/chats/chats_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/friend/domain/services/friends_service.dart';
import 'package:emotion_chat/features/friend/presentation/blocs/friends/friends_bloc.dart';
import 'package:emotion_chat/features/friend/presentation/blocs/invitations/invitation_bloc.dart';
import 'package:emotion_chat/features/friend/presentation/screens/invitations.dart';
import 'package:emotion_chat/features/user/presentation/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/features/user/presentation/screens/additional_user_info/additional_user_info_screen.dart';
import 'package:emotion_chat/features/user/presentation/screens/authenticated.dart';
import 'package:emotion_chat/features/user/presentation/screens/unauthenticated.dart';
import 'package:emotion_chat/repositories/chat/chat_repository.dart';
import 'package:emotion_chat/screens/chat/active_chat.dart';
import 'package:emotion_chat/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

mixin Screens {
  static const initial = '/';
  static const authenticated = 'authenticated';
  static const unauthenticated = 'unauthenticated';
  static const additionalInfo = 'additionalInfo';
  static const invitations = 'invitations';
  static const activeChat = 'activeChat';
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
      case Screens.activeChat:
        return activeChat(routeSettings.arguments);
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
              GetIt.I.get<FriendsService>(),
              GetIt.I.get<ChatRepository>(),
            )..startListening(),
          ),
          BlocProvider(
            create: (context) => FriendsBloc(
              GetIt.I.get<FriendsService>(),
            )..getAllFriends(),
          ),
        ],
        child: Authenticated(),
      ),
    );
  }

  MaterialPageRoute invitations() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => InvitationBloc(
          GetIt.I.get<FriendsService>(),
        )..listenOnInvitations(),
        child: Invitations(),
      ),
    );
  }

  MaterialPageRoute activeChat(Object? arguments) {
    final friend = arguments as ChatUser;
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => ActiveChatBloc(
            GetIt.I.get<ChatRepository>(),
            friend.uuid,
          )..startListeningForMessages(null),
          child: ActiveChat(userToChatWith: friend),
        );
      },
    );
  }
}
