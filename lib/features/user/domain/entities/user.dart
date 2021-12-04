import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final String uuid;
  final PhoneNumber phoneNumber;
  final EmailAddress emailAddress;
  final Name name;
  final ProfileImage profileImage;
  final Gender gender;
  final bool hasOwnImage;

  factory ChatUser.empty() {
    return ChatUser(
      emailAddress: EmailAddress.empty(),
      phoneNumber: PhoneNumber.empty(),
      profileImage: ProfileImage.empty(),
      name: Name.empty(),
      gender: Gender.empty(),
      hasOwnImage: false,
      uuid: '',
    );
  }

  UserDTO fromDomain() {
    return UserDTO(
      uid: uuid,
      emailAddress: emailAddress.toString(),
      phoneNumber: phoneNumber.toString(),
      profileImageUrl: profileImage.url,
      name: name.toString(),
      gender: gender.toString(),
      hasOwnImage: hasOwnImage,
    );
  }

  bool isValid() {
    if (emailAddress.isValid() &&
        phoneNumber.isValid() &&
        name.isValid() &&
        gender.isValid()) {
      return true;
    }
    return false;
  }

  ChatUser({
    required this.phoneNumber,
    required this.emailAddress,
    required this.name,
    required this.hasOwnImage,
    required this.gender,
    required this.profileImage,
    required this.uuid,
  });

  @override
  List<Object> get props => [
        phoneNumber.value,
        emailAddress.value,
        name.value,
        hasOwnImage,
        gender.value,
        uuid,
        profileImage.url,
      ];

  ChatUser copyWith({
    required String uid,
    required PhoneNumber phoneNumber,
    required EmailAddress emailAddress,
    required Name name,
    required ProfileImage profileImageUrl,
    required Gender gender,
    required bool hasOwnImage,
  }) {
    return ChatUser(
      uuid: uid,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
      name: name,
      profileImage: profileImageUrl,
      gender: gender,
      hasOwnImage: hasOwnImage,
    );
  }

  @override
  String toString() {
    return '{\nuid: $uuid,\n email: ${emailAddress.value},\n phone: ${phoneNumber.value},\n profileImageUrl: ${profileImage.url},\n name: ${name.value},\n gender: ${gender.value.toString()},\n hasOwnImage: $hasOwnImage,\n}';
  }
}
