import 'package:emotion_chat/router/my_router.dart';
import 'package:emotion_chat/screens/auth/additional_user_info/additional_user_info_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart' as http;

import 'data/data_transfer_objects/auth/user_dto.dart';
import 'injectable_init.dart';
import 'screens/core/consts/colors.dart';

void main() async {
  configureDependencies();
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => ImagePicker());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserDTOAdapter());
  runApp(AppConfig());
}

class AppConfig extends StatelessWidget {
  final router = MyRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdditionalUserInfoScreen(),
    );
    return MaterialApp(
      onGenerateRoute: router.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: '/additionalInfo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
    );
  }
}
