import 'package:emotion_chat/constants/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MyUser extends Equatable {
  final String uid;
  final PhoneNumber phoneNumber;
  final EmailAddress emailAddress;
  final Name name;
  final ProfileImage profileImage;
  final Gender gender;
  final bool hasOwnImage;
  final List<String> contactsUIDS;

  factory MyUser.empty() {
    return MyUser(
      emailAddress: EmailAddress.empty(),
      phoneNumber: PhoneNumber.empty(),
      profileImage: ProfileImage.empty(),
      name: Name.empty(),
      gender: Gender.empty(),
      hasOwnImage: false,
      contactsUIDS: [],
      uid: '',
    );
  }

  UserDTO fromDomain() {
    return UserDTO(
      uid: uid,
      emailAddress: emailAddress.toString(),
      phoneNumber: phoneNumber.toString(),
      profileImageUrl: profileImage.url,
      name: name.toString(),
      gender: gender.toString(),
      hasOwnImage: hasOwnImage,
      contactUids: contactsUIDS,
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

  MyUser({
    required this.phoneNumber,
    required this.emailAddress,
    required this.name,
    required this.hasOwnImage,
    required this.gender,
    required this.profileImage,
    required this.contactsUIDS,
    required this.uid,
  });

  @override
  List<Object> get props => [
        phoneNumber.value,
        emailAddress.value,
        name.value,
        hasOwnImage,
        gender.value,
        uid,
        contactsUIDS,
        profileImage.url,
      ];

  MyUser copyWith({
    required String uid,
    required PhoneNumber phoneNumber,
    required EmailAddress emailAddress,
    required Name name,
    required ProfileImage profileImageUrl,
    required Gender gender,
    required bool hasOwnImage,
    required List<String> contactsUIDS,
  }) {
    return MyUser(
      uid: uid,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
      name: name,
      profileImage: profileImageUrl,
      gender: gender,
      hasOwnImage: hasOwnImage,
      contactsUIDS: contactsUIDS,
    );
  }
}
