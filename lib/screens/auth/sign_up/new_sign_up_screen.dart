import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/animated_button.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSignUpScreen extends StatefulWidget {
  final PageController pageController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  const NewSignUpScreen({
    Key? key,
    required this.pageController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  }) : super(key: key);

  @override
  _NewSignUpScreenState createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
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
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                'Join us!',
                style: const TextStyle(
                    color: cWhite,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            BlocConsumer<AuthFormBloc, AuthFormState>(
                listener: (context, state) {
              if (state.hasError) {
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
                                'Sign up',
                                style: const TextStyle(
                                    color: cWhite,
                                    fontSize: 22,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: const SizedBox()),
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
                                  controller: widget.emailController,
                                  formInput: FormInput.emailAddress,
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
                        Expanded(child: const SizedBox()),
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
                                  controller: widget.phoneController,
                                  formInput: FormInput.phoneNumber,
                                  hint: 'Phone number...',
                                  prefixIcon: Icons.phone_android_outlined,
                                  suffixIcon: Icons.clear,
                                  action: () {
                                    BlocProvider.of<AuthFormBloc>(context)
                                        .add(AuthFormEvent.clearPhoneField());
                                    widget.phoneController.clear();
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
                        Expanded(child: const SizedBox()),
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
                                  formInput: FormInput.password,
                                  hint: 'Password...',
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: Icons.visibility_off_outlined,
                                  action: () => BlocProvider.of<AuthFormBloc>(
                                          context)
                                      .add(AuthFormEvent.showOrHidePassword()),
                                  isTextVisible: state.showPassword,
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: () {},
                                ),
                              ),
                              Expanded(flex: 7, child: const SizedBox()),
                            ],
                          ),
                        ),
                        Expanded(child: const SizedBox()),
                        Expanded(
                          flex: 2,
                          child: AnimatedButton(
                              formKey: _formKey,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.06,
                              title: 'Next',
                              onTap: () =>
                                  BlocProvider.of<AuthFormBloc>(context).add(
                                    AuthFormEvent.signUp(),
                                  ),
                              backgroundColor: cWhite,
                              endColor: cDarkGrey,
                              shadowColor: cLightGrey),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => widget.pageController.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn),
                                child: Text('Already have account',
                                    style: const TextStyle(
                                        color: cLightGrey,
                                        fontSize: 12,
                                        fontFamily: 'Lato')),
                              )
                            ],
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
