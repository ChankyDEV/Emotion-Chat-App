import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:mockito/mockito.dart';

class MockDatabaseService extends Mock implements DatabaseService {
  @override
  Future<String> findUserUidByEmail(String? email) async {
    return super.noSuchMethod(
      Invocation.method(#findUserUidByEmail, [email]),
      returnValueForMissingStub: Future.value('12345'),
      returnValue: Future.value('12345'),
    );
  }

  @override
  Future<void> sendInvitation({String? from, String? to}) {
    return super.noSuchMethod(
      Invocation.method(#sendInvitation, null, {
        #from: from,
        #to: to,
      }),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }
}

class MockLocalDatabaseService extends Mock implements LocalDatabaseService {
  @override
  Future<bool> isUserSaved() {
    return super.noSuchMethod(
      Invocation.method(#isUserSaved, null),
      returnValueForMissingStub: Future.value(true),
      returnValue: Future.value(true),
    );
  }

  @override
  Future<MyUser> getUser() {
    return super.noSuchMethod(
      Invocation.method(#getUser, null),
      returnValueForMissingStub: Future.value(MyUser.empty()),
      returnValue: Future.value(MyUser.empty()),
    );
  }
}

class MockAuthService extends Mock implements AuthService {}

class MockImageUploadService extends Mock implements ImageUploadService {}

class MockNetworkService extends Mock implements NetworkService {}
