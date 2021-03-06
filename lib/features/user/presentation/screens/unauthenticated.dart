import 'package:emotion_chat/features/user/presentation/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/features/user/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:emotion_chat/features/user/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Unauthenticated extends StatefulWidget {
  @override
  _UnauthenticatedState createState() => _UnauthenticatedState();
}

class _UnauthenticatedState extends State<Unauthenticated> {
  late PageController _pageController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      key: Key('pageView'),
      controller: _pageController,
      children: [
        SignInScreen(
          emailController: _emailController,
          passwordController: _passwordController,
          pageController: _pageController,
        ),
        SignUpScreen(
          pageController: _pageController,
          emailController: _emailController,
          passwordController: _passwordController,
          phoneController: _phoneController,
        )
      ],
    );
  }

  void initializeControllers() {
    _pageController = PageController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.addListener(() {
      BlocProvider.of<AuthFormBloc>(context)
          .add(AuthFormEvent.emailChanged(_emailController.text));
    });
    _phoneController.addListener(() {
      BlocProvider.of<AuthFormBloc>(context)
          .add(AuthFormEvent.phoneChanged(_phoneController.text));
    });
    _passwordController.addListener(() {
      BlocProvider.of<AuthFormBloc>(context)
          .add(AuthFormEvent.passwordChanged(_passwordController.text));
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
