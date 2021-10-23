import 'package:emotion_chat/constants/data.dart';
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
