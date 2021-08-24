part of 'additional_info_bloc.dart';

AdditionalInfoState _resetState() {
  return AdditionalInfoState.initial(
    name: Name.empty(),
    gender: Gender.empty(),
    photo: Image.asset('assets/images/boy.png'),
    hasPhoto: false,
    showLoading: false,
    activeStep: 1,
    doneStep: 0,
    failureOccured: false,
    failure: Failure(message: ''),
  );
}

bool _isCameraMethodChosen(ChoosePhotoMethod method) {
  return method == ChoosePhotoMethod.camera;
}

AdditionalInfoState _showFailure(AdditionalInfoState state,
    {required Failure failure}) {
  return state.copyWith(
    failureOccured: true,
    failure: failure,
    showLoading: false,
  );
}
