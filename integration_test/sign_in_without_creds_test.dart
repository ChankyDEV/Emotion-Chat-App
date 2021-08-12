import 'dart:math';

import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/injectable_init.dart';

import 'package:emotion_chat/screens/core/loading_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:emotion_chat/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Not inserting any credentials and trying to signIn wont move user to chats screen',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(SignInScreen), findsOneWidget);

    await tester.tap(find.byKey(Key('animatedButton_SignIn')));
    await tester.pumpAndSettle();
    expect(find.byType(SignInScreen), findsOneWidget);
    expect(find.byType(Chats), findsNothing);
  });
}
