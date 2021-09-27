mixin ErrorMessages {
  static const invitation = InvitationMessages();
  static const internet = InternetConnectionMessages();
  static const database = DatabaseMessages();
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

class DatabaseMessages {
  const DatabaseMessages();

  final cantFindUserUid = 'Cant get user uid with this email';
}
