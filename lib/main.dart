import 'package:emotion_chat/blocs/network/network_bloc.dart';
import 'package:emotion_chat/config.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'screens/core/consts/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cfg = Config();
  await cfg.setup();
  runApp(AppConfig());
}

class AppConfig extends StatelessWidget {
  final routing = GetIt.I.get<RoutingService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkBloc(GetIt.I.get<NetworkService>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routing.onGenerateRoute,
        initialRoute: '/',
        theme: ThemeData(
          scaffoldBackgroundColor: cDarkGrey,
        ),
      ),
    );
  }
}
