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
      'After imputing a good credentials chatsScreen should apear and the after click logout should back to signInScreen',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final email = '098765432';
    final pass = 'ZXC!23asd';
    await tester.enterText(find.byKey(Key('emailOrPhone')), email);
    await tester.enterText(find.byKey(Key('password')), pass);
    await tester.pumpAndSettle();

    expect(find.text(email), findsOneWidget);
    expect(find.text(pass), findsOneWidget);

    getIt<AuthFormBloc>().add(AuthFormEvent.emailChanged(email));
    getIt<AuthFormBloc>().add(AuthFormEvent.passwordChanged(pass));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('animatedButton_SignIn')));
    await tester.pumpAndSettle(Duration(milliseconds: 700));
    expect(find.byType(Chats), findsOneWidget);
    expect(find.byType(SignInScreen), findsNothing);

    await tester.tap(find.byKey(Key('logout_messages_button')));
    await tester.pumpAndSettle();

    expect(find.byType(SignInScreen), findsOneWidget);
    expect(find.byType(Chats), findsNothing);
  });
}
