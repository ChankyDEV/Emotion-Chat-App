part of 'additional_info_bloc.dart';

@freezed
class AdditionalInfoState with _$AdditionalInfoState {
  const factory AdditionalInfoState.initial({
    required Name name,
    required Gender gender,
    required Image photo,
    required bool hasPhoto,
    required bool showLoading,
    required int activeStep,
    required int doneStep,
    required bool failureOccured,
    required Failure failure,
  }) = _Initial;
}