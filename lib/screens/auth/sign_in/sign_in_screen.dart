import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/animated_button.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late FocusScopeNode _formNode;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _formNode = FocusScopeNode();
    super.initState();
  }

  @override
  void dispose() {
    _formNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: cDarkGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                'Welcome home!',
                style: const TextStyle(
                    color: cWhite,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            BlocConsumer<AuthFormBloc, AuthFormState>(
                listener: (context, state) {
              if (state.hasError == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    content: Container(
                      width: 0.9 * width,
                      height: 0.06 * height,
                      alignment: Alignment.center,
                      child: Text(
                        state.failureMessage,
                        style: bodyStyle.copyWith(color: Colors.white),
                      ),
                    ),
                    elevation: 12.0,
                    duration: Duration(milliseconds: 2500),
                  ),
                );
                BlocProvider.of<AuthFormBloc>(context)
                    .add(AuthFormEvent.resetErrors());
              }
            }, builder: (context, state) {
              return Form(
                autovalidateMode: state.validationMode,
                key: _formKey,
                child: FocusScope(
                  node: _formNode,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                'Sign in',
                                style: const TextStyle(
                                    color: cWhite,
                                    fontSize: 22,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: const SizedBox(
                          ),
                        ),
                        Expanded(
                          flex:3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(flex: 7, child: const SizedBox()),
                              Expanded(
                                flex: 86,
                                child: MyTextField(
                                  formNode: _formNode,
                                  controller: widget.emailController,
                                  inputType: InputType.emailAddress,
                                  hint: 'Email or mobile phone...',
                                  prefixIcon: Icons.mail_outline,
                                  suffixIcon: Icons.clear,
                                  action: () {
                                    BlocProvider.of<AuthFormBloc>(context)
                                        .add(AuthFormEvent.clearEmailField());
                                    widget.emailController.clear();
                                  },
                                  isTextVisible: true,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: () => _formNode.nextFocus(),
                                ),
                              ),
                              Expanded(flex: 7, child: const SizedBox()),
                            ],
                          ),
                        ),
                        Expanded(
                          child: const SizedBox(
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(flex: 7, child: const SizedBox()),
                              Expanded(
                                flex: 86,
                                child: MyTextField(
                                  formNode: _formNode,
                                  controller: widget.passwordController,
                                  inputType: InputType.password,
                                  hint: 'Password...',
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: Icons.visibility_off_outlined,
                                  action: () =>
                                      BlocProvider.of<AuthFormBloc>(context).add(
                                          AuthFormEvent.showOrHidePassword()),
                                  isTextVisible: state.showPassword,
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: () {},
                                ),
                              ),
                              Expanded(flex: 7, child: const SizedBox()),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: const SizedBox(
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: AnimatedButton(
                              formKey: _formKey,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.06,
                              title: 'Sign in',
                              onTap: () =>
                                  BlocProvider.of<AuthFormBloc>(context).add(
                                    AuthFormEvent.signIn(),
                                  ),
                              backgroundColor: cWhite,
                              endColor: cDarkGrey,
                              shadowColor: cLightGrey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => widget.pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn),
                                child: Text('Do not have an account',
                                    style: const TextStyle(
                                        color: cLightGrey,
                                        fontSize: 12,
                                        fontFamily: 'Lato')),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: const SizedBox(
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
