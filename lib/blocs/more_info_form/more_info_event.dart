part of 'more_info_bloc.dart';

@freezed
class MoreInfoFormEvent with _$MoreInfoFormEvent {
  const factory MoreInfoFormEvent.genderPositionChanged(
      {required int position}) = _GenderPositionChanged;
  const factory MoreInfoFormEvent.nameChanged({required String input}) =
      _NameChanged;
  const factory MoreInfoFormEvent.updateUserInformations() =
      _UpdateUserInformations;
  const factory MoreInfoFormEvent.openNameTextField() = _OpenNameTextField;
  const factory MoreInfoFormEvent.buttonClicked() = _ButtonClicked;
  const factory MoreInfoFormEvent.sendError() = _SendError;
  const factory MoreInfoFormEvent.chooseProfileImage(
      {required bool fromGallery}) = _ChooseProfileImage;
  const factory MoreInfoFormEvent.removeProfileImage() = _RemoveProfileImage;
}
