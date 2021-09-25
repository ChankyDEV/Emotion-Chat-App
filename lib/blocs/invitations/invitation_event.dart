part of 'invitation_bloc.dart';

@freezed
class InvitationEvent with _$InvitationEvent {
  const factory InvitationEvent.accept(Invitation invitation) =
      _AcceptInvitation;

  const factory InvitationEvent.delete(Invitation invitation) =
      _DeleteInvitation;

  const factory InvitationEvent.invitationsNumberChanged(
      List<Inviter> invites) = _InvitationsNumberChanged;
}
