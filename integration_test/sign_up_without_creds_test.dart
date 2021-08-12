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
      'Not inserting any credentials and trying to signUp wont move user to more info screen screen',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.fling(find.byType(SignInScreen), Offset(-150, 0), 300);

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('animatedButton_SignUp')));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpScreen), findsOneWidget);
    expect(find.byType(SignUpMoreInfoScreen), findsNothing);
  });
}
