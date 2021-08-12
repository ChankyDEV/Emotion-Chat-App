import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/user/user_repository.dart';
import 'package:emotion_chat/services/auth/i_auth_service.dart';
import 'package:emotion_chat/services/image_upload/i_image_service.dart';
import 'package:emotion_chat/services/local_db/i_local_db_service.dart';
import 'package:emotion_chat/services/network/i_network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks(
    [IAuthService, IImageUploadService, ILocalDatabaseService, INetworkService])
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
  final tUser = MyUser(
    emailAddress: tEmail,
    phoneNumber: tPhone,
    name: tName,
    gender: tGender,
    hasOwnImage: tHasOwnImage,
    contactsUIDS: tContactUids,
    profileImage: tProfileImage,
    uid: tUid,
  );

  late MockIAuthService authService;
  late MockILocalDatabaseService localDatabaseService;
  late MockIImageUploadService imageUploadService;
  late MockINetworkService networkService;
  late UserRepository repository;
  setUp(() {
    authService = MockIAuthService();
    localDatabaseService = MockILocalDatabaseService();
    imageUploadService = MockIImageUploadService();
    networkService = MockINetworkService();
    repository = UserRepository(
        imageService: imageUploadService,
        authService: authService,
        localDatabaseService: localDatabaseService,
        networkService: networkService);
  });

  group('If device has internet connection', () {
    setUp(() {
      when(networkService.isConnected).thenAnswer((_) async => true);
    });

    group('sign up', () {
      test(
          'should return empty user with specific credentials when user signUp succesfully',
          () async {
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
          'should return AuthFailure with specific message when user signUp unsuccesfully',
          () async {
        when(authService.signUpWithEmailAndPhone(
                emailAddress: anyNamed('emailAddress'),
                phoneNumber: anyNamed('phoneNumber'),
                password: anyNamed('password')))
            .thenThrow(AuthException(
                message: 'There is some problem with signing in'));
        final result = await repository.signUp(
            emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);

        verify(authService.signUpWithEmailAndPhone(
            emailAddress: tEmail, phoneNumber: tPhone, password: tPassword));
        verifyZeroInteractions(localDatabaseService);
        verifyNoMoreInteractions(authService);

        expect(
            result,
            left(
                AuthFailure(message: 'There is some problem with signing in')));
      });
    });
    group('sign in email', () {
      test(
          'should return empty user with specific credentials when user sign in email succesfully',
          () async {
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
          'should return AuthFailure with specific message when user sign in email unsuccesfully',
          () async {
        when(authService.signInWithEmail(
                emailAddress: anyNamed('emailAddress'),
                password: anyNamed('password')))
            .thenThrow(AuthException(
                message: 'There is some problem with signing in'));
        final result = await repository.signInWithEmail(
            emailAddress: tEmail, password: tPassword);

        verify(authService.signInWithEmail(
            emailAddress: tEmail, password: tPassword));
        verifyZeroInteractions(localDatabaseService);
        verifyNoMoreInteractions(authService);

        expect(
            result,
            left(
                AuthFailure(message: 'There is some problem with signing in')));
      });
    });
    group('sign in phone', () {
      test(
          'should return empty user with specific credentials when user sign in phone succesfully',
          () async {
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
          'should return AuthFailure with specific message when user sign in phone unsuccesfully',
          () async {
        when(authService.signInWithPhoneNumber(
                phoneNumber: anyNamed('phoneNumber'),
                password: anyNamed('password')))
            .thenThrow(AuthException(
                message: 'There is some problem with signing in'));
        final result = await repository.signInWithPhoneNumber(
            phoneNumber: tPhone, password: tPassword);

        verify(authService.signInWithPhoneNumber(
            phoneNumber: tPhone, password: tPassword));
        verifyZeroInteractions(localDatabaseService);
        verifyNoMoreInteractions(authService);

        expect(
            result,
            left(
                AuthFailure(message: 'There is some problem with signing in')));
      });
    });
    group('update user info', () {
      final tUserUpdated = MyUser(
        uid: tUid,
        emailAddress: tEmail,
        phoneNumber: tPhone,
        name: Name(value: 'kamil'),
        gender: tGender,
        contactsUIDS: tContactUids,
        hasOwnImage: false,
        profileImage: tProfileImage,
      );
      final tUserUpdatedWithImage = MyUser(
        uid: tUid,
        emailAddress: tEmail,
        phoneNumber: tPhone,
        name: Name(value: 'kamil'),
        gender: tGender,
        contactsUIDS: tContactUids,
        hasOwnImage: true,
        profileImage: tProfileImage,
      );
      test(
          'should return unit when user updates his info without profileImage succesffully',
          () async {
        when(authService.getSignedInUser()).thenAnswer((_) async => tUser);
        when(
          authService.updateUserInfo(
            name: anyNamed('name'),
            gender: anyNamed('gender'),
            generatedImageUploadUrl: anyNamed('generatedImageUploadUrl'),
            hasOwnImage: anyNamed('hasOwnImage'),
            uid: anyNamed('uid'),
          ),
        ).thenAnswer((_) async => tUserUpdated);
        final result = await repository.updateUserInfo(
            name: Name(value: 'kamil'),
            gender: tGender,
            hasOwnImage: tHasOwnImage);
        verify(
          authService.updateUserInfo(
            name: Name(value: 'kamil'),
            gender: tGender,
            generatedImageUploadUrl: '',
            hasOwnImage: tUser.hasOwnImage,
            uid: tUser.uid,
          ),
        );
        verify(authService.getSignedInUser());
        verify(localDatabaseService.saveUser(tUserUpdated));
        verify(authService.addInfoAboutUserToStream(tUserUpdated));
        expect(result, right(unit));
      });
      test(
          'should return unit when user updates his info with profileImage succesffully',
          () async {
        when(authService.getSignedInUser()).thenAnswer((_) async => tUser);
        when(imageUploadService.generateProfileImageUrl(
                profileImage: anyNamed('profileImage'), uid: anyNamed('uid')))
            .thenAnswer((_) async => 'http://12345.pl');
        when(
          authService.updateUserInfo(
            name: anyNamed('name'),
            gender: anyNamed('gender'),
            generatedImageUploadUrl: anyNamed('generatedImageUploadUrl'),
            hasOwnImage: anyNamed('hasOwnImage'),
            uid: anyNamed('uid'),
          ),
        ).thenAnswer((_) async => tUserUpdatedWithImage);

        final result = await repository.updateUserInfo(
            name: Name(value: 'kamil'), gender: tGender, hasOwnImage: true);
        verify(
          authService.updateUserInfo(
            name: Name(value: 'kamil'),
            gender: tGender,
            generatedImageUploadUrl: 'http://12345.pl',
            hasOwnImage: true,
            uid: tUser.uid,
          ),
        );
        verify(imageUploadService.generateProfileImageUrl(
            profileImage: null, uid: tUid));
        verify(authService.getSignedInUser());
        verify(localDatabaseService.saveUser(tUserUpdatedWithImage));
        verify(authService.addInfoAboutUserToStream(tUserUpdatedWithImage));
        expect(result, right(unit));
      });

      test(
          'should return AuthFailure when there is problem with generating upload url',
          () async {
        when(authService.getSignedInUser()).thenAnswer((_) async => tUser);
        when(imageUploadService.generateProfileImageUrl(
                profileImage: anyNamed('profileImage'), uid: anyNamed('uid')))
            .thenThrow(AuthException(
                message: 'error occured while generating upload url'));

        final result = await repository.updateUserInfo(
            name: Name(value: 'kamil'), gender: tGender, hasOwnImage: true);
        verify(authService.getSignedInUser());
        verify(imageUploadService.generateProfileImageUrl(
            profileImage: null, uid: tUid));
        verifyNoMoreInteractions(authService);
        verifyZeroInteractions(localDatabaseService);
        expect(
            result,
            equals(left(AuthFailure(
                message: 'error occured while generating upload url'))));
      });

      test('should return AuthFailure when there is problem with updating info',
          () async {
        when(authService.getSignedInUser()).thenAnswer((_) async => tUser);
        when(imageUploadService.generateProfileImageUrl(
                profileImage: anyNamed('profileImage'), uid: anyNamed('uid')))
            .thenAnswer((_) async => 'http://12345.pl');
        when(authService.updateUserInfo(
                name: anyNamed('name'),
                gender: anyNamed('gender'),
                generatedImageUploadUrl: anyNamed('generatedImageUploadUrl'),
                hasOwnImage: anyNamed('hasOwnImage'),
                uid: anyNamed('uid')))
            .thenThrow(
                AuthException(message: 'error occured while updating info'));
        final result = await repository.updateUserInfo(
            name: Name(value: 'kamil'), gender: tGender, hasOwnImage: true);
        verify(authService.getSignedInUser());
        verify(imageUploadService.generateProfileImageUrl(
            profileImage: null, uid: tUid));
        verify(authService.updateUserInfo(
            name: Name(value: 'kamil'),
            gender: tGender,
            generatedImageUploadUrl: 'http://12345.pl',
            hasOwnImage: true,
            uid: tUid));
        verifyNoMoreInteractions(authService);
        verifyZeroInteractions(localDatabaseService);
        expect(
            result,
            equals(left(
                AuthFailure(message: 'error occured while updating info'))));
      });
    });
  });

  group('If device has not internet connection', () {
    setUp(() {
      when(networkService.isConnected).thenAnswer((_) async => false);
    });
    test('sign up should return NetworkFalure', () async {
      final result = await repository.signUp(
          emailAddress: tEmail, phoneNumber: tPhone, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
    test('sign in email should return NetworkFalure', () async {
      final result = await repository.signInWithEmail(
          emailAddress: tEmail, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
    test('sign in phone should return NetworkFalure', () async {
      final result = await repository.signInWithPhoneNumber(
          phoneNumber: tPhone, password: tPassword);
      expect(result, left(NetworkFailure(message: 'No internet connection')));
    });
  });

  group('logout', () {
    test('should return true if user logs out succesffully', () async {
      when(localDatabaseService.removeUser()).thenAnswer((_) async => _);
      final result = await repository.logout();
      verify(localDatabaseService.removeUser());
      verify(authService.addInfoAboutUserToStream(MyUser.empty()));
      expect(result, true);
    });
    test('should return false if user logs out unsuccesffully', () async {
      when(localDatabaseService.removeUser())
          .thenThrow(AuthException(message: 'cant remove user'));
      final result = await repository.logout();
      verify(localDatabaseService.removeUser());
      verifyZeroInteractions(authService);
      expect(result, false);
    });
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
      verify(authService.addInfoAboutUserToStream(MyUser.empty()));
      expect(result, false);
    });
  });
}
