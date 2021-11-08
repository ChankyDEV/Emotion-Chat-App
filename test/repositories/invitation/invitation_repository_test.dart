import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/friend/data/services/friends_service_impl.dart';
import 'package:emotion_chat/features/friend/domain/services/friends_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mocks.dart';

void main() {
  late FriendsService service;
  late MockLocalRepository local;
  late MockNetworkInfo network;
  late MockFriendsRepository friendsRepository;
  late MockUserRepository userRepository;
  const tEmail = 'test@gmail.com';
  const tReceiverUuid = '12345';
  const tSenderUid = '54321';
  final tUser = ChatUser(
    phoneNumber: PhoneNumber.empty(),
    emailAddress: EmailAddress.empty(),
    name: Name.empty(),
    hasOwnImage: false,
    gender: Gender.empty(),
    profileImage: ProfileImage(url: 'https://123.com'),
    uuid: tSenderUid,
  );
  setUpAll(() {
    friendsRepository = MockFriendsRepository();
    local = MockLocalRepository();
    network = MockNetworkInfo();
    userRepository = MockUserRepository();
    service = FriendsServiceImpl(
      friendsRepository,
      userRepository,
      local,
      network,
    );
  });

  test(
      'should return unit if successfully found user by email and local user is saved',
      () async {
    when(network.isConnected).thenAnswer((_) async => true);
    when(local.isUserSaved()).thenAnswer((_) async => true);
    when(userRepository.findUserUuidByEmail(any))
        .thenAnswer((_) async => tReceiverUuid);
    when(local.getUser()).thenAnswer((_) async => tUser);

    final result = await service.sendInvitation(tEmail);

    verify(local.isUserSaved());
    verify(userRepository.findUserUuidByEmail(tEmail));
    verify(local.getUser());
    verify(friendsRepository.sendInvitation(
      from: tUser.uuid,
      to: tReceiverUuid,
    ));
    expect(result, right(unit));
  });

  test('should return failure if local user is not saved', () async {
    final noSavedUserFailure = Failure(message: 'Cant send invitation now');
    when(network.isConnected).thenAnswer((_) async => true);
    when(local.isUserSaved()).thenAnswer((_) async => false);

    final result = await service.sendInvitation(tEmail);

    verify(local.isUserSaved());
    verifyNever(userRepository.findUserUuidByEmail(tEmail));
    verifyNever(local.getUser());
    verifyNever(friendsRepository.sendInvitation(
      from: tUser.uuid,
      to: tReceiverUuid,
    ));
    expect(result, left(noSavedUserFailure));
  });

  test('should return failure if cant find userUid by email', () async {
    final noUserWithEmailFailure =
        Failure(message: 'There is no user with particular email');
    when(network.isConnected).thenAnswer((_) async => true);
    when(local.isUserSaved()).thenAnswer((_) async => true);
    when(userRepository.findUserUuidByEmail(any)).thenThrow(
      NoUserWithEmailException(
          message: 'There is no user with particular email'),
    );

    final result = await service.sendInvitation(tEmail);

    verify(local.isUserSaved());
    verify(userRepository.findUserUuidByEmail(tEmail));
    verifyNever(local.getUser());
    verifyNever(friendsRepository.sendInvitation(
      from: tUser.uuid,
      to: tReceiverUuid,
    ));
    expect(result, left(noUserWithEmailFailure));
  });
}
