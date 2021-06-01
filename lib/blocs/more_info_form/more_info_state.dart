part of 'more_info_bloc.dart';

@freezed
class MoreInfoFormState with _$MoreInfoFormState {
  const factory MoreInfoFormState.initial({
    required int genderPosition,
    required Name name,
    required bool isNameTextFieldOpened,
    required bool isButtonClicked,
    required bool hasErrors,
    required Image profileImage,
    required bool updateUpWentWell,
    required bool isImageUploaded,
  }) = _Initial;
}
