import 'package:emotion_chat/constants/screens.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final PageController pageController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignInScreen(
      {Key? key,
      required this.pageController,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 0.35 * height,
                        width: width,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 5,
                              bottom: -17,
                              child: Image.asset(
                                'assets/images/standing.png',
                                scale: 5.75,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 150,
                              bottom: 0,
                              child: IgnorePointer(
                                child: Image.asset(
                                  'assets/images/disorder.png',
                                  scale: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      Container(
                        height: 0.65 * height,
                        width: width,
                        child: Column(
                          children: [
                            Flexible(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 30),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'SIGN IN',
                                  style: titleStyle,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                child: SignInForm(
                                    pageController: widget.pageController,
                                    emailController: widget.emailController,
                                    passwordController:
                                        widget.passwordController,
                                    formKey: _formKey),
                              ),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
