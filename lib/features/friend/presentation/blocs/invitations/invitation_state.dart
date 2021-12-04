part of 'invitation_bloc.dart';

@freezed
class InvitationState with _$InvitationState {
  const factory InvitationState.initial({
    required List<Inviter> inviters,
    required int numberOfInviters,
    InfoDialog? infoDialog,
  }) = _Initial;
}
