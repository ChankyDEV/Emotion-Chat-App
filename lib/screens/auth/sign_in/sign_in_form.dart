import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  const SignInForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.pageController,
      required this.formKey})
      : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * width),
      child: BlocConsumer<AuthFormBloc, AuthFormState>(
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
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: state.validationMode,
            key: widget.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EmailOrPhoneTextField(
                  clearFunction: () => BlocProvider.of<AuthFormBloc>(context)
                      .add(AuthFormEvent.clearEmailField()),
                  controller: widget.emailController,
                  hint: 'Email or phone',
                  formInput: FormInput.both,
                  isPhoneNumber: state.isPhoneNumber,
                  icon: Icon(
                    Icons.email,
                    color: lightAccentColor,
                  ),
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                PasswordTextField(
                  passwordController: widget.passwordController,
                  hideOrShowPassword: () =>
                      BlocProvider.of<AuthFormBloc>(context)
                          .add(AuthFormEvent.showOrHidePassword()),
                  isPasswordVisible: state.showPassword,
                ),
                SizedBox(
                  height: 0.05 * height,
                ),
                AnimatedButton(
                  key: Key('animatedButton_SignIn'),
                  formKey: widget.formKey,
                  width: 0.4 * width,
                  height: 0.055 * height,
                  backgroundColor: darkAccentColor,
                  endColor: backgroundColor,
                  shadowColor: mBlack,
                  title: 'sign in',
                  onTap: () => BlocProvider.of<AuthFormBloc>(context).add(
                    AuthFormEvent.signIn(),
                  ),
                ),
                SizedBox(
                  height: 0.012 * height,
                ),
                GestureDetector(
                  onTap: () => widget.pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                  child: Container(
                    width: width,
                    alignment: Alignment.center,
                    child: Text(
                      'Dont have account',
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
  }
}
