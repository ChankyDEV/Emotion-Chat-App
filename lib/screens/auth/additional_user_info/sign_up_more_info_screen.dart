import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/screens/auth/additional_user_info/sign_up_button.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gender_switch.dart';
import 'image_picker.dart';
import 'name_textfield.dart';

List<Widget> _putCorrectWidgetOnTop(
    bool isImageUploaded, Widget firstWidget, Widget secondWidget) {
  return isImageUploaded
      ? [firstWidget, secondWidget]
      : [secondWidget, firstWidget];
}

class SignUpMoreInfoScreen extends StatelessWidget {
  final PageController _genderController = PageController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final size = width <= height ? width : height;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                    child: BlocBuilder<MoreInfoFormBloc, MoreInfoFormState>(
                  builder: (context, state) {
                    return Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width,
                              height: 0.75 * size,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.15 * size,
                                        right: 0.15 * size,
                                        top: 0.2 * size),
                                    child: Stack(
                                      children: _putCorrectWidgetOnTop(
                                          state.isImageUploaded,
                                          AbsorbPointer(
                                            absorbing: state.isImageUploaded
                                                ? true
                                                : false,
                                            child: Opacity(
                                              opacity:
                                                  state.isImageUploaded ? 0 : 1,
                                              child: ImagePicker(
                                                genderPosition:
                                                    state.genderPosition,
                                                genderController:
                                                    _genderController,
                                              ),
                                            ),
                                          ),
                                          AbsorbPointer(
                                            absorbing: state.isImageUploaded
                                                ? false
                                                : true,
                                            child: Opacity(
                                              opacity:
                                                  state.isImageUploaded ? 1 : 0,
                                              child: CircleImage(
                                                  size: size, state: state),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Positioned(
                                      top: 25,
                                      left: 7,
                                      child: Text(
                                        'Profile image'.toUpperCase(),
                                        style: bodyStyle,
                                      )),
                                  Positioned(
                                      top: 10,
                                      right: 0,
                                      child: IconButton(
                                          key: Key('logoutMoreInfo'),
                                          icon: Icon(
                                            Icons.logout,
                                            color: whiteColor,
                                          ),
                                          onPressed: () =>
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .logout())),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: width,
                              height: 0.15 * height,
                              child: Stack(
                                children: [
                                  NameTextField(
                                    formKey: _formKey,
                                    isNameTextFieldOpen:
                                        state.isNameTextFieldOpened,
                                  ),
                                  Positioned(
                                      top: 20,
                                      left: 7,
                                      child: Text(
                                        'Name'.toUpperCase(),
                                        style: bodyStyle,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              width: width,
                              height: 0.35 * height,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: GenderSwitch(
                                      genderController: _genderController,
                                    ),
                                  ),
                                  Positioned(
                                      top: 25,
                                      left: 7,
                                      child: Text(
                                        'Gender'.toUpperCase(),
                                        style: bodyStyle,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: SignUpButton(
                                formKey: _formKey,
                                isButtonClicked: state.isButtonClicked,
                                updateWentWell: state.updateUpWentWell,
                                hasErrors: state.hasErrors,
                                onTap: () {
                                  BlocProvider.of<MoreInfoFormBloc>(context)
                                      .add(MoreInfoFormEvent.buttonClicked());
                                  BlocProvider.of<MoreInfoFormBloc>(context)
                                      .add(MoreInfoFormEvent
                                          .updateUserInformations());
                                },
                              ),
                            ),
                          ]),
                    );
                  },
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.size,
    required this.state,
  }) : super(key: key);

  final double size;
  final MoreInfoFormState state;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        right: 20,
        top: 10,
        child: Container(
          width: 0.11 * size,
          height: 0.11 * size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
          ),
          child: IconButton(
              icon: Icon(
                Icons.add,
                color: mBlack,
                size: 24.0,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<MoreInfoFormBloc>(context).add(
                                    MoreInfoFormEvent.chooseProfileImage(
                                        fromGallery: true));
                              },
                              child: DialogItem(
                                sideWidth: 80,
                                icon: Icons.image,
                                text: 'Gallery',
                                backgroundColor: whiteColor,
                                iconColor: mBlack,
                                textColor: mBlack,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<MoreInfoFormBloc>(context).add(
                                    MoreInfoFormEvent.chooseProfileImage(
                                        fromGallery: false));
                              },
                              child: DialogItem(
                                sideWidth: 80,
                                icon: Icons.camera,
                                text: 'Camera',
                                backgroundColor: whiteColor,
                                iconColor: mBlack,
                                textColor: mBlack,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }),
        ),
      ),
      Positioned(
        right: 5,
        top: 50,
        child: Container(
          width: 0.11 * size,
          height: 0.11 * size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
          ),
          child: IconButton(
              icon: Icon(
                Icons.delete,
                color: mBlack,
                size: 24.0,
              ),
              onPressed: () {
                BlocProvider.of<MoreInfoFormBloc>(context)
                    .add(MoreInfoFormEvent.removeProfileImage());
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 0.5 * size,
            height: 0.5 * size,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: mBlack,
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(0, 0),
                )
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: state.profileImage.image, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    ]);
  }
}
