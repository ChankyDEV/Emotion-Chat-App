mixin ErrorMessages {
  static const invitation = InvitationMessages();
  static const internet = InternetConnectionMessages();
}

class InvitationMessages {
  const InvitationMessages();

  final alreadySentInvitation = 'User already send an invitation';
  final sendingInvitationError =
      'Error occured while trying to send invitation';
}

class InternetConnectionMessages {
  const InternetConnectionMessages();

  final noConnection = 'User dont have internet connection';
}
