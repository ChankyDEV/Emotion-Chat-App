import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'more_info_bloc.freezed.dart';

part 'more_info_event.dart';

part 'more_info_state.dart';

@LazySingleton()
class MoreInfoFormBloc extends Bloc<MoreInfoFormEvent, MoreInfoFormState> {
  late final IUserRepository userRepository;
  late final IImagePickerRepository profileImagePicker;

  MoreInfoFormBloc({
    required this.userRepository,
    required this.profileImagePicker,
  }) : super(_Initial(
          genderPosition: 0,
          name: Name.empty(),
          isNameTextFieldOpened: false,
          isButtonClicked: false,
          hasErrors: false,
          profileImage: Image.asset('assets/images/boy.png'),
          updateUpWentWell: false,
          isImageUploaded: false,
        ));

  @override
  Stream<MoreInfoFormState> mapEventToState(
    MoreInfoFormEvent event,
  ) async* {
    yield* event.map(genderPositionChanged: (e) async* {
      print(state.genderPosition);
      yield state.copyWith(genderPosition: e.position);
    }, nameChanged: (e) async* {
      yield state.copyWith(name: Name(value: e.input));
    }, updateUserInformations: (e) async* {
      final authState = await stateAfterAuthResult(state, e);
      yield authState;
    }, openNameTextField: (e) async* {
      yield state.copyWith(isNameTextFieldOpened: true);
    }, buttonClicked: (e) async* {
      yield state.copyWith(isButtonClicked: true);
    }, sendError: (e) async* {
      yield state.copyWith(hasErrors: true);
    }, chooseProfileImage: (e) async* {
      Either<Failure, MyPickedFile> imageOrFailure;
      if (e.fromGallery) {
        imageOrFailure = await profileImagePicker.getImageFromGallery();
      } else {
        imageOrFailure = await profileImagePicker.getImageFromCamera();
      }
      yield* imageOrFailure.fold((_) async* {
        yield state.copyWith(
          isImageUploaded: false,
        );
      }, (r) async* {
        yield state.copyWith(
          isImageUploaded: true,
          profileImage: Image.file(File(r.path)),
        );
      });
    }, removeProfileImage: (e) async* {
      yield state.copyWith(
        isImageUploaded: false,
      );
    });
  }

  Future<MoreInfoFormState> stateAfterAuthResult(
      MoreInfoFormState state, _UpdateUserInformations event) async {
    List<Gender> genders = [
      Gender(value: GenderEnum.male),
      Gender(value: GenderEnum.female),
      Gender(value: GenderEnum.none),
    ];
    var failureOrUnit;

    // TODO: REPLACE NULL
    if (state.isImageUploaded) {
      failureOrUnit = await userRepository.updateUserInfo(
          hasOwnImage: true,
          gender: genders[state.genderPosition],
          name: state.name,
          profileImage: state.profileImage);
    } else {
      failureOrUnit = await userRepository.updateUserInfo(
        hasOwnImage: false,
        gender: genders[state.genderPosition],
        name: state.name,
        profileImage: null,
      );
    }
    return stateFromAuthResult(failureOrUnit, event);
  }

  MoreInfoFormState stateFromAuthResult(
      Either<Failure, Unit> authResult, _UpdateUserInformations event) {
    if (authResult.isRight()) {
      return state.copyWith(hasErrors: false, updateUpWentWell: true);
    }
    return state.copyWith(hasErrors: true);
  }
}
