import 'package:emotion_chat/constants/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final String value;

  const EmailAddress({required this.value});

  factory EmailAddress.empty() {
    return EmailAddress(value: '');
  }

  @override
  String toString() {
    return value;
  }

  @override
  bool isValid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  @override
  List<Object> get props => [value];

  EmailAddress copyWith({
    required String value,
  }) {
    return EmailAddress(
      value: value,
    );
  }
}

class PhoneNumber extends ValueObject<String> {
  @override
  final String value;

  const PhoneNumber({required this.value});

  factory PhoneNumber.empty() {
    return PhoneNumber(value: '');
  }
  @override
  String toString() {
    return value;
  }

  @override
  List<Object> get props => [value];

  @override
  bool isValid() => RegExp(r"^\d{9}$").hasMatch(value);

  PhoneNumber copyWith({
    required String value,
  }) {
    return PhoneNumber(
      value: value,
    );
  }
}

class Password extends ValueObject<String> {
  @override
  bool isValid() {
    return RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
        .hasMatch(value);
  }

  @override
  List<Object> get props => [value];

  @override
  final String value;

  const Password({required this.value});

  @override
  Password copyWith({
    required String value,
  }) {
    return Password(
      value: value,
    );
  }
}

class Name extends ValueObject<String> {
  @override
  final String value;

  const Name({required this.value});

  @override
  bool isValid() => value.isNotEmpty && !value.contains(' ') ? true : false;

  factory Name.empty() {
    return Name(value: '');
  }

  @override
  String toString() {
    return value;
  }

  @override
  List<Object> get props => [value];

  @override
  Name copyWith({required String value}) {
    return Name(
      value: value,
    );
  }
}

class Gender extends ValueObject<GenderEnum> {
  const Gender({required this.value});

  factory Gender.fromString(String input) {
    if (input == 'GenderEnum.male') {
      return Gender(value: GenderEnum.male);
    } else if (input == 'GenderEnum.female') {
      return Gender(value: GenderEnum.female);
    } else if (input == 'GenderEnum.none') {
      return Gender(value: GenderEnum.none);
    }
    return Gender(value: GenderEnum.none);
  }

  @override
  String toString() {
    return value.toString();
  }

  @override
  bool isValid() {
    // ignore: unnecessary_null_comparison
    if (value != null) {
      return true;
    }
    return false;
  }

  factory Gender.empty() {
    return Gender(value: GenderEnum.none);
  }

  @override
  List<Object> get props => [value.toString()];

  @override
  final value;

  @override
  Gender copyWith({required GenderEnum value}) {
    return Gender(
      value: value,
    );
  }
}

class ProfileImage extends Equatable {
  final String url;

  ProfileImage({required this.url});

  factory ProfileImage.empty() {
    return ProfileImage(url: "");
  }

  bool isEmpty() {
    if (this.url == "") {
      return true;
    } else {
      return false;
    }
  }

  bool isNotEmpty() {
    if (this.url == "") {
      return false;
    } else {
      return true;
    }
  }

  @override
  List<Object> get props => [url];
}
