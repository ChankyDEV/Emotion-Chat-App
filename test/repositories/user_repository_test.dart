import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/user/data/services/user_service_impl.dart';
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

  late MockAuthService authService;
  late MockLocalRepository localDatabaseService;
  late MockImageService imageService;
  late MockNetworkInfo networkService;
  late MockDatabaseService dbService;
  late UserServiceImpl repository;
  setUpAll(() {
    authService = MockAuthService();
    localDatabaseService = MockLocalRepository();
    imageService = MockImageService();
    networkService = MockNetworkInfo();
    dbService = MockDatabaseService();
    repository = UserServiceImpl(
        db: dbService,
        imageService: imageService,
        authService: authService,
        localDatabaseService: localDatabaseService,
        networkService: networkService);
  });

  group('sign up', () {
    test(
        'should return empty user with specific credentials when user signUp successfully',
        () async {
      when(networkService.isConnected).thenAnswer((_) async => true);
      when(authService.signUpWithEmailAndPhone(
              emailAddress: anyNamed('emailAddress'),
              phoneNumber: anyNamed('phoneNumber'),
              password: anyNamed('password')))
          .thenAnswer((_) async => tUser);
      final result = await repository.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);
      verify(authService.signUpWithEmailAndPhone(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword));
      verify(localDatabaseService.saveUser(tUser));
      verify(authService.addInfoAboutUserToStream(tUser));

      expect(result, right(tUser));
    });

    test(
        'should return AuthFailure with specific message when user signUp unsuccessfully',
        () async {
      when(networkService.isConnected).thenAnswer((_) async => true);
      when(
        authService.signUpWithEmailAndPhone(
          emailAddress: anyNamed('emailAddress'),
          phoneNumber: anyNamed('phoneNumber'),
          password: anyNamed('password'),
        ),
      ).thenThrow(
        AuthException(message: 'There is some problem with signing in'),
      );
      final result = await repository.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);

      verify(
        authService.signUpWithEmailAndPhone(
            emailAddress: tEmail, phoneNumber: tPhone, password: tPassword),
      );
      verifyNoMoreInteractions(authService);

      expect(result,
          left(AuthFailure(message: 'There is some problem with signing in')));
    });
  });
  group('sign in email', () {
    test(
        'should return empty user with specific credentials when user sign in email successfully',
        () async {
      when(networkService.isConnected).thenAnswer((_) async => true);
      when(authService.signInWithEmail(
              emailAddress: anyNamed('emailAddress'),
              password: anyNamed('password')))
          .thenAnswer((_) async => tUser);
      final result = await repository.signInWithEmail(
          emailAddress: tEmail, password: tPassword);
      verify(authService.signInWithEmail(
          emailAddress: tEmail, password: tPassword));
      verify(localDatabaseService.saveUser(tUser));
      verify(authService.addInfoAboutUserToStream(tUser));

      expect(result, right(tUser));
    });

    test(
        'should return AuthFailure with specific message when user sign in email unsuccessfully',
        () async {
      when(networkService.isConnected).thenAnswer((_) async => true);
      when(authService.signInWithEmail(
              emailAddress: anyNamed('emailAddress'),
              password: anyNamed('password')))
          .thenThrow(
              AuthException(message: 'There is some problem with signing in'));
      final result = await repository.signInWithEmail(
          emailAddress: tEmail, password: tPassword);

      verify(authService.signInWithEmail(
          emailAddress: tEmail, password: tPassword));
      verifyNoMoreInteractions(authService);

      expect(result,
          left(AuthFailure(message: 'There is some problem with signing in')));
    });
  });
  group('sign in phone', () {
    test(
        'should return empty user with specific credentials when user sign in phone successfully',
        () async {
      when(networkService.isConnected).thenAnswer((_) async => true);
      when(authService.signInWithPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              password: anyNamed('password')))
          .thenAnswer((_) async => tUser);
      final result = await repository.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);
      verify(authService.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword));
      verify(localDatabaseService.saveUser(tUser));
      verify(authService.addInfoAboutUserToStream(tUser));

      expect(result, right(tUser));
    });

    test(
        'should return AuthFailure with specific message when user sign in phone unsuccessfully',
        () async {
      when(networkService.isConnected).thenAnswer((_) async => true);
      when(authService.signInWithPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              password: anyNamed('password')))
          .thenThrow(
              AuthException(message: 'There is some problem with signing in'));
      final result = await repository.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);

      verify(authService.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword));
      verifyNoMoreInteractions(authService);

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
    when(networkService.isConnected).thenAnswer((_) async => true);
    when(authService.getSignedInUser()).thenAnswer((_) async => tUser);

    final result = await repository.updateUserInfo(
        name: Name(value: 'kamil'), gender: tGender, hasOwnImage: tHasOwnImage);

    verify(authService.getSignedInUser());
    verify(localDatabaseService.saveUser(tUserUpdated));
    verify(authService.addInfoAboutUserToStream(tUserUpdated));
    expect(result, right(unit));
  });
  test(
      'update user info should return unit when user updates his info with profileImage successfully',
      () async {
    when(networkService.isConnected).thenAnswer((_) async => true);
    when(authService.getSignedInUser()).thenAnswer((_) async => tUser);

    final result = await repository.updateUserInfo(
        name: Name(value: 'kamil'), gender: tGender, hasOwnImage: true);

    verify(authService.getSignedInUser());
    verify(localDatabaseService.saveUser(tUserUpdatedWithImage));
    verify(authService.addInfoAboutUserToStream(tUserUpdatedWithImage));
    expect(result, right(unit));
  });

  test(
      'update user info should return AuthFailure when there is problem with generating upload url',
      () async {
    when(networkService.isConnected).thenAnswer((_) async => true);
    when(authService.getSignedInUser()).thenAnswer((_) async => tUser);
    when(imageService.getProfileImageUrl(uid: anyNamed('uid'))).thenThrow(
      AuthException(message: 'error occurred while generating upload url'),
    );

    final result = await repository.updateUserInfo(
      name: Name(value: 'kamil'),
      gender: tGender,
      hasOwnImage: true,
    );
    verify(authService.getSignedInUser());
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
    when(networkService.isConnected).thenAnswer((_) async => true);
    when(authService.getSignedInUser()).thenAnswer((_) async => tUser);
    when(imageService.getProfileImageUrl(uid: anyNamed('uid')))
        .thenAnswer((_) async => '');
    when(dbService.updateUser(any)).thenThrow(
      AuthException(message: 'error occurred while updating info'),
    );

    final result = await repository.updateUserInfo(
      name: Name(value: 'kamil'),
      gender: tGender,
      hasOwnImage: true,
    );
    verify(authService.getSignedInUser());
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
      when(networkService.isConnected).thenAnswer((_) async => false);
    });
    test('sign up should return NetworkFailure', () async {
      final result = await repository.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
    test('sign in email should return NetworkFailure', () async {
      final result = await repository.signInWithEmail(
          emailAddress: tEmail, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
    test('sign in phone should return NetworkFailure', () async {
      final result = await repository.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
  });
  test('logout should return true if user logs out successfully', () async {
    when(localDatabaseService.removeUser()).thenAnswer((_) async => _);
    final result = await repository.logout();
    verify(localDatabaseService.removeUser());
    verify(authService.addInfoAboutUserToStream(ChatUser.empty()));
    expect(result, true);
  });
  test('logout should return false if user logs out unsuccessfully', () async {
    when(localDatabaseService.removeUser())
        .thenThrow(AuthException(message: 'cant remove user'));
    final result = await repository.logout();
    verify(localDatabaseService.removeUser());
    expect(result, false);
  });

  group('check if user is logged in', () {
    test(
        'should return true when user is saved and user can get it successfully',
        () async {
      when(localDatabaseService.isUserSaved()).thenAnswer((_) async => true);
      when(localDatabaseService.getUser()).thenAnswer((_) async => tUser);
      final result = await repository.checkIfUserIsLoggedIn();
      verify(authService.addInfoAboutUserToStream(tUser));
      expect(result, true);
    });
    test(
        'should return false when user is saved and user cant get it successfully',
        () async {
      when(localDatabaseService.isUserSaved()).thenAnswer((_) async => true);
      when(localDatabaseService.getUser())
          .thenThrow(AuthException(message: 'message'));
      final result = await repository.checkIfUserIsLoggedIn();
      expect(result, false);
    });
    test('should return false when user is not saved ', () async {
      when(localDatabaseService.isUserSaved()).thenAnswer((_) async => false);
      final result = await repository.checkIfUserIsLoggedIn();
      verify(authService.addInfoAboutUserToStream(ChatUser.empty()));
      expect(result, false);
    });
  });
}
