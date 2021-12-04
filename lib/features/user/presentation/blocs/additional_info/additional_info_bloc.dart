import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/image/domain/services/image_service.dart';
import 'package:emotion_chat/features/user/domain/entities/choose_photo_method.dart';
import 'package:emotion_chat/features/user/domain/entities/gender_enum.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/features/user/domain/services/auth_service.dart';
import 'package:emotion_chat/utils/domain/failure.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_info_bloc.freezed.dart';
part 'additional_info_bloc_helpers.dart';
part 'additional_info_event.dart';
part 'additional_info_state.dart';

class AdditionalInfoBloc
    extends Bloc<AdditionalInfoEvent, AdditionalInfoState> {
  late final ImageService _imagePickerRepository;
  late final AuthService _userRepository;
  MyPickedFile? _userPhoto;

  AdditionalInfoBloc({
    required ImageService imagePickerRepository,
    required AuthService userRepository,
  }) : super(
          _Initial(
            name: Name.empty(),
            gender: Gender.empty(),
            photo: Image.asset('assets/images/boy.png'),
            hasPhoto: false,
            showLoading: false,
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
      nameChanged: _nameChanged,
      nameCleared: _nameCleared,
      stepChanged: _stepChanged,
      closeError: _closeErrorDialog,
      genderChanged: _genderChanged,
      particularStepChanged: _particularStepChanged,
      addPhoto: _addPhotoByMethod,
      removePhoto: _removePhoto,
    );
  }

  Stream<AdditionalInfoState> _nameChanged(_NameChanged event) async* {
    yield state.copyWith(
      name: Name(value: event.input),
    );
  }

  Stream<AdditionalInfoState> _nameCleared(_NameCleared event) async* {
    yield state.copyWith(
      name: Name.empty(),
    );
  }

  Stream<AdditionalInfoState> _stepChanged(_StepChanged event) async* {
    int activeStep = state.activeStep + 1;
    int doneStep = state.doneStep + 1;
    if (state.activeStep < 3) {
      yield state.copyWith(
        activeStep: activeStep,
        doneStep: doneStep,
      );
    } else {
      yield* _showLoading();
      yield* _saveChanges();
    }
  }

  Stream<AdditionalInfoState> _showLoading() async* {
    yield state.copyWith(showLoading: true);
  }

  Stream<AdditionalInfoState> _saveChanges() async* {
    final unitOrFailure = await _userRepository.updateUserInfo(
      name: state.name,
      gender: state.gender,
      profileImage: _userPhoto,
      hasOwnImage: state.hasPhoto,
    );
    yield unitOrFailure.fold<AdditionalInfoState>(
      (l) => _showFailure(state, failure: l),
      (r) => _resetState(),
    );
  }

  Stream<AdditionalInfoState> _closeErrorDialog(_CloseError event) async* {
    yield state.copyWith(
      failureOccured: false,
    );
  }

  Stream<AdditionalInfoState> _genderChanged(_GenderChanged event) async* {
    yield state.copyWith(gender: Gender(value: event.activeGender));
  }

  Stream<AdditionalInfoState> _particularStepChanged(
      _ParticularStepChanged event) async* {
    yield state.copyWith(
      activeStep: event.activeStepIndex,
      doneStep: event.doneStepIndex,
    );
  }

  Stream<AdditionalInfoState> _addPhotoByMethod(
      _AddPhotoFromCamera event) async* {
    final failureOrPhoto = _isCameraMethodChosen(event.method)
        ? await _imagePickerRepository.getImageFromCamera()
        : await _imagePickerRepository.getImageFromGallery();
    yield failureOrPhoto.fold<AdditionalInfoState>(
      (l) => _showFailure(state, failure: l),
      (r) => _showAddedPhoto(r),
    );
  }

  AdditionalInfoState _showAddedPhoto(MyPickedFile r) {
    _userPhoto = MyPickedFile(r.path);
    return state.copyWith(
      photo: Image.file(File(r.path)),
      hasPhoto: true,
    );
  }

  Stream<AdditionalInfoState> _removePhoto(_RemovePhoto event) async* {
    _userPhoto = null;
    yield state.copyWith(
      hasPhoto: false,
      photo: Image.asset('assets/images/boy.png'),
    );
  }
}
