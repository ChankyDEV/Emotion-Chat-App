import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  final PageController pageController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignUpForm(
      {Key? key,
      required this.pageController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController,
      required this.formKey})
      : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          color: state.areInputsWrong ? Colors.red : Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 0.08 * width),
          child: BlocConsumer<AuthFormBloc, AuthFormState>(
            listener: (context, state) {
              if (state.hasError == true) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    content: Container(
                      width: 0.9 * width,
                      height: 0.04 * height,
                      alignment: Alignment.center,
                      child: Text(
                        state.failureMessage,
                        style: bodyStyle.copyWith(color: Colors.white),
                      ),
                    ),
                    elevation: 12.0,
                    duration: Duration(milliseconds: 1500),
                  ),
                );

                BlocProvider.of<AuthFormBloc>(context)
                    .add(AuthFormEvent.resetErrors());
              }
            },
            builder: (context, state) {
              return Form(
                autovalidateMode: state.validationMode,
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EmailOrPhoneTextField(
                      key: Key('emailSignUpField'),
                      clearFunction: () =>
                          BlocProvider.of<AuthFormBloc>(context).add(
                        AuthFormEvent.clearEmailField(),
                      ),
                      controller: widget.emailController,
                      hint: 'Email',
                      formInput: InputType.emailAddress,
                      isPhoneNumber: state.isPhoneNumber,
                      icon: Icon(
                        Icons.email,
                        color: mBlack,
                      ),
                    ),
                    SizedBox(
                      height: 0.03 * height,
                    ),
                    EmailOrPhoneTextField(
                      key: Key('phoneSignUpField'),
                      clearFunction: () =>
                          BlocProvider.of<AuthFormBloc>(context).add(
                        AuthFormEvent.clearPhoneField(),
                      ),
                      controller: widget.phoneController,
                      hint: 'Phone',
                      formInput: InputType.phoneNumber,
                      isPhoneNumber: true,
                      icon: Icon(
                        Icons.phone,
                        color: mBlack,
                      ),
                    ),
                    SizedBox(
                      height: 0.03 * height,
                    ),
                    PasswordTextField(
                      key: Key('passwordSignUpField'),
                      passwordController: widget.passwordController,
                      hideOrShowPassword: () =>
                          BlocProvider.of<AuthFormBloc>(context).add(
                        AuthFormEvent.showOrHidePassword(),
                      ),
                      isPasswordVisible: state.showPassword,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 0.05 * height,
                      ),
                    ),
                    AnimatedButton(
                      key: Key('animatedButton_SignUp'),
                      formKey: widget.formKey,
                      width: 0.4 * width,
                      height: 0.055 * height,
                      backgroundColor: darkAccentColor,
                      endColor: backgroundColor,
                      shadowColor: mBlack,
                      title: 'next',
                      onTap: () => Future.delayed(
                        Duration(milliseconds: 500),
                        () => BlocProvider.of<AuthFormBloc>(context).add(
                          AuthFormEvent.signUp(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 0.012 * height,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => widget.pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      child: Container(
                        width: width,
                        alignment: Alignment.center,
                        child: Text(
                          'Already have account',
                          style: bodyStyle.copyWith(fontSize: 12.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: const SizedBox(),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      alignment: Alignment.center,
                      width: width,
                      height: state.hasNetworkConnection ? 0 : 0.05 * height,
                      child: Text(
                        'No internet connection',
                        style: bodyStyle,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
