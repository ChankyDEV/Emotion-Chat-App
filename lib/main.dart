import 'package:emotion_chat/config.dart';
import 'package:emotion_chat/router/my_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/core/consts/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cfg = Config();
  await cfg.setup();
  runApp(AppConfig());
}

class AppConfig extends StatelessWidget {
  final router = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: cDarkGrey,
      ),
    );
  }
}
