import 'package:emotion_chat/constants/data.dart';

class Receiver {
  final String uid;
  final Name name;
  final ProfileImage profileImage;
  final bool hasOwnImage;
  final Gender gender;

  Receiver(
      {required this.uid,
      required this.name,
      required this.profileImage,
      required this.hasOwnImage,
      required this.gender});
}
