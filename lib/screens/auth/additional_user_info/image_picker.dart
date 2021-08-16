import 'package:emotion_chat/blocs/more_info_form/more_info_bloc.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/dialog_item.dart';
import 'package:emotion_chat/screens/core/widgets/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatelessWidget {
  final PageController genderController;
  final int genderPosition;
  const ImagePicker(
      {Key? key, required this.genderController, required this.genderPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            dragStartBehavior: DragStartBehavior.start,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) => BlocProvider.of<MoreInfoFormBloc>(context)
                .add(MoreInfoFormEvent.genderPositionChanged(position: value)),
            controller: genderController,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    image: DecorationImage(
                        image: Image.asset(
                      'assets/images/boy.png',
                    ).image)),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    image: DecorationImage(
                        image: Image.asset(
                      'assets/images/girl.png',
                    ).image)),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    image: DecorationImage(
                        image: Image.asset(
                      'assets/images/user.png',
                      scale: 1.3,
                    ).image)),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 75,
          right: 75,
          child: Indicator(
            position: genderPosition,
            dots: 3,
          ),
        ),
        Positioned(
          right: 10,
          top: 5,
          child: IconButton(
              icon: Icon(
                Icons.add,
                color: whiteColor,
                size: 36.0,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
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
      ],
    );
  }
}


