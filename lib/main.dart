import 'package:emotion_chat/config.dart';
import 'package:emotion_chat/features/logger/domain/chat_logger.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/network/presentation/blocs/network/network_bloc.dart';
import 'package:emotion_chat/features/routing/routing_service.dart';
import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cfg = Config();
  await cfg.setup();
  GetIt.I.get<ChatLogger>().info('Application has been configured');
  runApp(AppConfig());
}

class AppConfig extends StatelessWidget {
  final routing = GetIt.I.get<RoutingService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkBloc(GetIt.I.get<NetworkInfo>()),
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
