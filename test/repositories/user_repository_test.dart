import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/user/data/services/user_service_impl.dart';
import 'package:emotion_chat/features/user/domain/entities/gender_enum.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:emotion_chat/utils/data/utils/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/mocks.dart';

void main() {
  const tEmail = EmailAddress(value: 'email');
  const tPhone = PhoneNumber(value: 'phone');
  const tPassword = Password(value: 'password');
  const tName = Name(value: '');
  const tGender = Gender(value: GenderEnum.none);
  const tHasOwnImage = false;
  const tContactUids = [''];
  final tProfileImage = ProfileImage(url: '');
  const tUid = 'ID123123210123213';
  final tUser = ChatUser(
    emailAddress: tEmail,
    phoneNumber: tPhone,
    name: tName,
    gender: tGender,
    hasOwnImage: tHasOwnImage,
    profileImage: tProfileImage,
    uuid: tUid,
  );

  late MockAuthRepository authRepository;
  late MockLocalRepository localRepository;
  late MockImageRepository imageRepository;
  late MockNetworkInfo networkInfo;
  late UserServiceImpl service;
  late MockUserRepository userRepository;
  setUpAll(() {
    authRepository = MockAuthRepository();
    localRepository = MockLocalRepository();
    imageRepository = MockImageRepository();
    networkInfo = MockNetworkInfo();
    userRepository = MockUserRepository();
    service = UserServiceImpl(
      imageRepository: imageRepository,
      authRepository: authRepository,
      localRepository: localRepository,
      networkInfo: networkInfo,
      userRepository: userRepository,
    );
  });

  group('sign up', () {
    test(
        'should return empty user with specific credentials when user signUp successfully',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(authRepository.signUpWithEmailAndPhone(
              emailAddress: anyNamed('emailAddress'),
              phoneNumber: anyNamed('phoneNumber'),
              password: anyNamed('password')))
          .thenAnswer((_) async => tUser);
      final result = await service.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);
      verify(authRepository.signUpWithEmailAndPhone(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword));
      verify(localRepository.saveUser(tUser));
      verify(authRepository.addInfoAboutUserToStream(tUser));

      expect(result, right(tUser));
    });

    test(
        'should return AuthFailure with specific message when user signUp unsuccessfully',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(
        authRepository.signUpWithEmailAndPhone(
          emailAddress: anyNamed('emailAddress'),
          phoneNumber: anyNamed('phoneNumber'),
          password: anyNamed('password'),
        ),
      ).thenThrow(
        AuthException(message: 'There is some problem with signing in'),
      );
      final result = await service.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);

      verify(
        authRepository.signUpWithEmailAndPhone(
            emailAddress: tEmail, phoneNumber: tPhone, password: tPassword),
      );
      verifyNoMoreInteractions(authRepository);

      expect(result,
          left(AuthFailure(message: 'There is some problem with signing in')));
    });
  });
  group('sign in email', () {
    test(
        'should return empty user with specific credentials when user sign in email successfully',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(authRepository.signInWithEmail(
              emailAddress: anyNamed('emailAddress'),
              password: anyNamed('password')))
          .thenAnswer((_) async => tUser);
      final result = await service.signInWithEmail(
          emailAddress: tEmail, password: tPassword);
      verify(authRepository.signInWithEmail(
          emailAddress: tEmail, password: tPassword));
      verify(localRepository.saveUser(tUser));
      verify(authRepository.addInfoAboutUserToStream(tUser));

      expect(result, right(tUser));
    });

    test(
        'should return AuthFailure with specific message when user sign in email unsuccessfully',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(authRepository.signInWithEmail(
              emailAddress: anyNamed('emailAddress'),
              password: anyNamed('password')))
          .thenThrow(
              AuthException(message: 'There is some problem with signing in'));
      final result = await service.signInWithEmail(
          emailAddress: tEmail, password: tPassword);

      verify(authRepository.signInWithEmail(
          emailAddress: tEmail, password: tPassword));
      verifyNoMoreInteractions(authRepository);

      expect(result,
          left(AuthFailure(message: 'There is some problem with signing in')));
    });
  });
  group('sign in phone', () {
    test(
        'should return empty user with specific credentials when user sign in phone successfully',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(authRepository.signInWithPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              password: anyNamed('password')))
          .thenAnswer((_) async => tUser);
      final result = await service.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);
      verify(authRepository.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword));
      verify(localRepository.saveUser(tUser));
      verify(authRepository.addInfoAboutUserToStream(tUser));

      expect(result, right(tUser));
    });

    test(
        'should return AuthFailure with specific message when user sign in phone unsuccessfully',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(authRepository.signInWithPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              password: anyNamed('password')))
          .thenThrow(
              AuthException(message: 'There is some problem with signing in'));
      final result = await service.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);

      verify(authRepository.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword));
      verifyNoMoreInteractions(authRepository);

      expect(result,
          left(AuthFailure(message: 'There is some problem with signing in')));
    });
  });
  final tUserUpdated = ChatUser(
    uuid: tUid,
    emailAddress: tEmail,
    phoneNumber: tPhone,
    name: Name(value: 'kamil'),
    gender: tGender,
    hasOwnImage: false,
    profileImage: tProfileImage,
  );
  final tUserUpdatedWithImage = ChatUser(
    uuid: tUid,
    emailAddress: tEmail,
    phoneNumber: tPhone,
    name: Name(value: 'kamil'),
    gender: tGender,
    hasOwnImage: true,
    profileImage: tProfileImage,
  );
  test(
      'update user info should return unit when user updates his info without profileImage successfully',
      () async {
    when(networkInfo.isConnected).thenAnswer((_) async => true);
    when(authRepository.getSignedInUser()).thenAnswer((_) async => tUser);

    final result = await service.updateUserInfo(
        name: Name(value: 'kamil'), gender: tGender, hasOwnImage: tHasOwnImage);

    verify(authRepository.getSignedInUser());
    verify(localRepository.saveUser(tUserUpdated));
    verify(authRepository.addInfoAboutUserToStream(tUserUpdated));
    expect(result, right(unit));
  });
  test(
      'update user info should return unit when user updates his info with profileImage successfully',
      () async {
    when(networkInfo.isConnected).thenAnswer((_) async => true);
    when(authRepository.getSignedInUser()).thenAnswer((_) async => tUser);

    final result = await service.updateUserInfo(
        name: Name(value: 'kamil'), gender: tGender, hasOwnImage: true);

    verify(authRepository.getSignedInUser());
    verify(localRepository.saveUser(tUserUpdatedWithImage));
    verify(authRepository.addInfoAboutUserToStream(tUserUpdatedWithImage));
    expect(result, right(unit));
  });

  test(
      'update user info should return AuthFailure when there is problem with generating upload url',
      () async {
    when(networkInfo.isConnected).thenAnswer((_) async => true);
    when(authRepository.getSignedInUser()).thenAnswer((_) async => tUser);
    when(imageRepository.getProfileImageUrl(uid: anyNamed('uid'))).thenThrow(
      AuthException(message: 'error occurred while generating upload url'),
    );

    final result = await service.updateUserInfo(
      name: Name(value: 'kamil'),
      gender: tGender,
      hasOwnImage: true,
    );
    verify(authRepository.getSignedInUser());
    expect(
      result,
      equals(
        left(
          AuthFailure(message: 'error occurred while generating upload url'),
        ),
      ),
    );
  });

  test(
      'update user info should return AuthFailure when there is problem with updating info',
      () async {
    when(networkInfo.isConnected).thenAnswer((_) async => true);
    when(authRepository.getSignedInUser()).thenAnswer((_) async => tUser);
    when(imageRepository.getProfileImageUrl(uid: anyNamed('uid')))
        .thenAnswer((_) async => '');
    when(userRepository.updateUser(any)).thenThrow(
      AuthException(message: 'error occurred while updating info'),
    );

    final result = await service.updateUserInfo(
      name: Name(value: 'kamil'),
      gender: tGender,
      hasOwnImage: true,
    );
    verify(authRepository.getSignedInUser());
    expect(
      result,
      equals(
        left(
          AuthFailure(message: 'error occurred while updating info'),
        ),
      ),
    );
  });

  group('If device has not internet connection', () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
    });
    test('sign up should return NetworkFailure', () async {
      final result = await service.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
    test('sign in email should return NetworkFailure', () async {
      final result = await service.signInWithEmail(
          emailAddress: tEmail, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
    test('sign in phone should return NetworkFailure', () async {
      final result = await service.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
  });
  test('logout should return true if user logs out successfully', () async {
    when(localRepository.removeUser()).thenAnswer((_) async => _);
    final result = await service.logout();
    verify(localRepository.removeUser());
    verify(authRepository.addInfoAboutUserToStream(ChatUser.empty()));
    expect(result, true);
  });
  test('logout should return false if user logs out unsuccessfully', () async {
    when(localRepository.removeUser())
        .thenThrow(AuthException(message: 'cant remove user'));
    final result = await service.logout();
    verify(localRepository.removeUser());
    expect(result, false);
  });

  group('check if user is logged in', () {
    test(
        'should return true when user is saved and user can get it successfully',
        () async {
      when(localRepository.isUserSaved()).thenAnswer((_) async => true);
      when(localRepository.getUser()).thenAnswer((_) async => tUser);
      final result = await service.checkIfUserIsLoggedIn();
      verify(authRepository.addInfoAboutUserToStream(tUser));
      expect(result, true);
    });
    test(
        'should return false when user is saved and user cant get it successfully',
        () async {
      when(localRepository.isUserSaved()).thenAnswer((_) async => true);
      when(localRepository.getUser())
          .thenThrow(AuthException(message: 'message'));
      final result = await service.checkIfUserIsLoggedIn();
      expect(result, false);
    });
    test('should return false when user is not saved ', () async {
      when(localRepository.isUserSaved()).thenAnswer((_) async => false);
      final result = await service.checkIfUserIsLoggedIn();
      verify(authRepository.addInfoAboutUserToStream(ChatUser.empty()));
      expect(result, false);
    });
  });
}
