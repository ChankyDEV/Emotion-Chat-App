

part of 'additional_info_bloc.dart';

@freezed
class AdditionalInfoEvent with _$AdditionalInfoEvent {
  const factory AdditionalInfoEvent.nameChanged(String input) = _NameChanged;
  const factory AdditionalInfoEvent.nameCleared() = _NameCleared;
  const factory AdditionalInfoEvent.stepChanged() = _StepChanged;
  const factory AdditionalInfoEvent.genderChanged(GenderEnum activeGender) = _GenderChanged;
  const factory AdditionalInfoEvent.particularStepChanged(int doneStepIndex,
      int activeStepIndex) = _ParticularStepChanged;
  const factory AdditionalInfoEvent.closeError() = _CloseError;
  const factory AdditionalInfoEvent.addPhotoFromCamera() = _AddPhotoFromCamera;
  const factory AdditionalInfoEvent.addPhotoFromGallery() = _AddPhotoFromGallery;
}