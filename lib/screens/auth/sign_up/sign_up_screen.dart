import 'package:emotion_chat/screens/auth/sign_up/sign_up_form.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SignUpScreen extends StatefulWidget {
  final PageController pageController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  const SignUpScreen(
      {Key? key,
      required this.pageController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController})
      : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
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
                            right: 5,
                            bottom: -17,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Image.asset(
                                'assets/images/siting.png',
                                scale: 3.5,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 20,
                              left: -215,
                              bottom: 0,
                              child: IgnorePointer(
                                child: Image.asset(
                                  'assets/images/disorder.png',
                                  scale: 1,
                                ),
                              )),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.65 * height,
                      width: width,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.only(left: 30, top: 30),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'SIGN UP',
                                style: titleStyle,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              child: SignUpForm(
                                  phoneController: widget.phoneController,
                                  pageController: widget.pageController,
                                  emailController: widget.emailController,
                                  passwordController: widget.passwordController,
                                  formKey: formKey),
                            ),
                          ),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
