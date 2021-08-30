import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mocks.dart';

void main() {
  late InvitationRepository repository;
  late MockDatabaseService db;
  late MockLocalDatabaseService local;
  const tEmail = 'test@gmail.com';
  const tReceiverUid = '12345';
  const tSenderUid = '54321';
  final tUser = MyUser(
    phoneNumber: PhoneNumber.empty(),
    emailAddress: EmailAddress.empty(),
    name: Name.empty(),
    hasOwnImage: false,
    gender: Gender.empty(),
    profileImage: ProfileImage(url: 'https://123.com'),
    contactsUIDS: [],
    uid: tSenderUid,
  );
  setUpAll(() {
    db = MockDatabaseService();
    local = MockLocalDatabaseService();
    repository = InvitationRepositoryImpl(
      db: db,
      local: local,
    );
  });

  test(
      'should return unit if successfully found user by email and local user is saved',
      () async {
    when(local.isUserSaved()).thenAnswer((_) async => true);
    when(db.findUserUidByEmail(any)).thenAnswer((_) async => tReceiverUid);
    when(local.getUser()).thenAnswer((_) async => tUser);

    final result = await repository.sendInvitationForEmail(tEmail);

    verify(local.isUserSaved());
    verify(db.findUserUidByEmail(tEmail));
    verify(local.getUser());
    verify(db.sendInvitation(
      from: tUser.uid,
      to: tReceiverUid,
    ));
    expect(result, right(unit));
  });

  test('should return failure if local user is not saved', () async {
    final noSavedUserFailure = Failure(message: 'Cant send invitation now');
    when(local.isUserSaved()).thenAnswer((_) async => false);

    final result = await repository.sendInvitationForEmail(tEmail);

    verify(local.isUserSaved());
    verifyNever(db.findUserUidByEmail(tEmail));
    verifyNever(local.getUser());
    verifyNever(db.sendInvitation(
      from: tUser.uid,
      to: tReceiverUid,
    ));
    expect(result, left(noSavedUserFailure));
  });

  test('should return failure if cant find userUid by email', () async {
    final noUserWithEmailFailure =
        Failure(message: 'There is no user with particular email');
    when(local.isUserSaved()).thenAnswer((_) async => true);
    when(db.findUserUidByEmail(any)).thenThrow(
      NoUserWithEmailException(
          message: 'There is no user with particular email'),
    );

    final result = await repository.sendInvitationForEmail(tEmail);

    verify(local.isUserSaved());
    verify(db.findUserUidByEmail(tEmail));
    verifyNever(local.getUser());
    verifyNever(db.sendInvitation(
      from: tUser.uid,
      to: tReceiverUid,
    ));
    expect(result, left(noUserWithEmailFailure));
  });
}
