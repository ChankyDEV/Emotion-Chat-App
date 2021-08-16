import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'additional_info_bloc.freezed.dart';

part 'additional_info_event.dart';

part 'additional_info_state.dart';

@LazySingleton()
class AdditionalInfoBloc
    extends Bloc<AdditionalInfoEvent, AdditionalInfoState> {
  late final IImagePickerRepository _imagePickerRepository;
  late final IUserRepository _userRepository;

  AdditionalInfoBloc({
    required IImagePickerRepository imagePickerRepository,
    required IUserRepository userRepository,
  }) : super(
          _Initial(
            name: Name.empty(),
            gender: Gender.empty(),
            photo: Image.asset('assets/images/boy.png'),
            hasPhoto: false,
            activeStep: 1,
            doneStep: 0,
            failureOccured: false,
            failure: Failure(message: ''),
          ),
        ) {
    this._userRepository = userRepository;
    this._imagePickerRepository = imagePickerRepository;
  }

  @override
  Stream<AdditionalInfoState> mapEventToState(
      AdditionalInfoEvent event) async* {
    yield* event.map(
      nameChanged: (e) async* {
        yield state.copyWith(
          name: Name(value: e.input),
        );
      },
      nameCleared: (e) async* {
        yield state.copyWith(
          name: Name.empty(),
        );
      },
      stepChanged: (e) async* {
        int activeStep = state.activeStep + 1;
        int doneStep = state.doneStep + 1;
        if (state.activeStep < 3) {
          yield state.copyWith(
            activeStep: activeStep,
            doneStep: doneStep,
          );
        } else {
          print('Name: ${state.name}, Gender: ${state.gender}');

          //final hasOwnImage = state.photo.image != '';
          // final unitOrFailure = await _userRepository.updateUserInfo(
          //   name: state.name,
          //   gender: state.gender,
          //   profileImage: state.photo,
          //   hasOwnImage: hasOwnImage,
          // );
          // yield unitOrFailure.fold<AdditionalInfoState>(
          //   (l) => showFailure(failure: l),
          //   (r) => resetState(),
          // );
        }
      },
      closeError: (e) async* {
        yield state.copyWith(
          failureOccured: false,
        );
      },
      genderChanged: (e) async* {
        yield state.copyWith(gender: Gender(value: e.activeGender));
      },
      particularStepChanged: (e) async* {
        yield state.copyWith(
          activeStep: e.activeStepIndex,
          doneStep: e.doneStepIndex,
        );
      },
      addPhotoFromCamera: (e) async* {
        final failureOrPhoto =
            await _imagePickerRepository.getImageFromCamera();
        yield failureOrPhoto.fold<AdditionalInfoState>(
          (l) => showFailure(failure: l),
          (r) => showAddedPhoto(r),
        );
      },
      addPhotoFromGallery: (e) async* {
        _imagePickerRepository.getImageFromGallery();
      },
    );
  }

  AdditionalInfoState showFailure({required Failure failure}) {
    return state.copyWith(
      failureOccured: true,
      failure: failure,
    );
  }

  AdditionalInfoState resetState() {
    return AdditionalInfoState.initial(
      name: Name.empty(),
      gender: Gender.empty(),
      photo: Image.asset('assets/images/boy.png'),
      hasPhoto: false,
      activeStep: 1,
      doneStep: 0,
      failureOccured: false,
      failure: Failure(message: ''),
    );
  }

  AdditionalInfoState showAddedPhoto(MyPickedFile r) {
    return state.copyWith(
      photo: Image.file(File(r.path)),
      hasPhoto: true,
    );
  }
}
