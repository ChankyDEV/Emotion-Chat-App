import 'package:emotion_chat/constants/data.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_dto.g.dart';

@HiveType(typeId: 0)
class UserDTO extends Equatable {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String phoneNumber;
  @HiveField(2)
  final String emailAddress;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String profileImageUrl;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final bool hasOwnImage;

  UserDTO({
    required this.uid,
    required this.emailAddress,
    required this.phoneNumber,
    required this.profileImageUrl,
    required this.name,
    required this.gender,
    required this.hasOwnImage,
  });

  @override
  List<Object> get props =>
      [emailAddress, phoneNumber, name, gender, hasOwnImage];

  factory UserDTO.fromJson(Map<String, dynamic>? json) {
    return UserDTO(
      uid: json!['uid'],
      emailAddress: json['email'],
      phoneNumber: json['phone'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      gender: json['gender'],
      hasOwnImage: json['hasOwnImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': emailAddress,
      'phone': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'name': name,
      'gender': gender,
      'hasOwnImage': hasOwnImage,
    };
  }

  MyUser toDomain() {
    return MyUser(
      uid: uid,
      emailAddress: EmailAddress(value: emailAddress),
      phoneNumber: PhoneNumber(value: phoneNumber),
      name: Name(value: name),
      hasOwnImage: hasOwnImage,
      gender: Gender.fromString(gender),
      profileImage: ProfileImage(url: profileImageUrl),
    );
  }
}
