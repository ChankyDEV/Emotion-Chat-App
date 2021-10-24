import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final ChatUser user;

  const UserProfileImage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user.hasOwnImage
        ? Image.network(user.profileImage.url)
        : _buildImageByGender();
  }

  Widget _buildImageByGender() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      ),
      child: Container(
        height: 40.0,
        width: 40.0,
        padding: const EdgeInsets.only(top: 4.0),
        child: _chooseImage(),
        color: cWhite.withOpacity(0.1),
      ),
    );
  }

  Widget _chooseImage() {
    switch (user.gender.value) {
      case GenderEnum.male:
        return Image.asset('assets/images/boy.png');
      case GenderEnum.female:
        return Image.asset('assets/images/girl.png');
        break;
      case GenderEnum.none:
        return Image.asset('assets/images/user.png');
        break;
    }
  }
}
