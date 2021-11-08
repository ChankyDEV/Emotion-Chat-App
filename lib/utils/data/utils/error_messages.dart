mixin ErrorMessages {
  static const invitation = InvitationMessages._();
  static const internet = InternetConnectionMessages._();
  static const database = DatabaseMessages._();
  static const classification = ClassificationMessages._();
}

class InvitationMessages {
  const InvitationMessages._();

  final alreadySentInvitation = 'User already send an invitation';
  final sendingInvitationError =
      'Error occured while trying to send invitation';
}

class InternetConnectionMessages {
  const InternetConnectionMessages._();

  final noConnection = 'User dont have internet connection';
  final error = 'Error occurred while processing request';
}

class DatabaseMessages {
  const DatabaseMessages._();
  final cantGetData = 'Cant get data from particular collection';
  final cantFindUserUid = 'Cant get user uid with this email';
  final cantAddData = 'Cant add data to particular collection';
}

class ClassificationMessages {
  const ClassificationMessages._();

  final error = 'Error occurred while trying to classify content';
}
