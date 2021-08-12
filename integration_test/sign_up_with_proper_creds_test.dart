import 'dart:math';

import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/blocs/more_info_form/more_info_bloc.dart';
import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/injectable_init.dart';

import 'package:emotion_chat/screens/core/loading_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:emotion_chat/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final phone = '662128335';
  final pass = 'ZXC!23asd';
  final email = 'genia1004@gmail.com';
  final name = 'Kamil';
  testWidgets(
      'Not inserting any credentials and trying to signUp wont move user to more info screen screen',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.fling(find.byType(SignInScreen), Offset(-150, 0), 300);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('emailSignUpField')), email);
    await tester.enterText(find.byKey(Key('phoneSignUpField')), phone);
    await tester.enterText(find.byKey(Key('passwordSignUpField')), pass);
    await tester.pumpAndSettle();

    getIt<AuthFormBloc>().add(AuthFormEvent.emailChanged(email));
    getIt<AuthFormBloc>().add(AuthFormEvent.phoneChanged(phone));
    getIt<AuthFormBloc>().add(AuthFormEvent.passwordChanged(pass));

    await tester.tap(find.byKey(Key('animatedButton_SignUp')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    expect(find.byType(SignUpMoreInfoScreen), findsOneWidget);
    expect(find.byType(SignUpScreen), findsNothing);

    await tester.enterText(find.byKey(Key('nameField')), name);
    getIt<MoreInfoFormBloc>().add(MoreInfoFormEvent.nameChanged(input: name));
    await tester.pumpAndSettle(Duration(milliseconds: 500));

    await tester.tap(find.byKey(Key('signUpButton')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));

    expect(find.byType(Chats), findsOneWidget);
    expect(find.byType(SignUpMoreInfoScreen), findsNothing);
  });
}
