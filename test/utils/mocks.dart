import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:emotion_chat/features/image/domain/services/image_service.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:mockito/mockito.dart';

class MockDatabaseService extends Mock implements DatabaseService {
  @override
  Future<String> findUserUuidByEmail(String? email) async {
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

  @override
  Future<void> addUser(ChatUser user) {
    return super.noSuchMethod(
      Invocation.method(#addUser, [user]),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }

  @override
  Future<void> updateUser(ChatUser? user) {
    return super.noSuchMethod(
      Invocation.method(#updateUser, [user]),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }
}

class MockLocalDatabaseService extends Mock implements LocalRepository {
  @override
  Future<bool> isUserSaved() {
    return super.noSuchMethod(
      Invocation.method(#isUserSaved, null),
      returnValueForMissingStub: Future.value(true),
      returnValue: Future.value(true),
    );
  }

  @override
  Future<ChatUser> getUser() {
    return super.noSuchMethod(
      Invocation.method(#getUser, null),
      returnValueForMissingStub: Future.value(ChatUser.empty()),
      returnValue: Future.value(ChatUser.empty()),
    );
  }

  Future<void> removeUser() {
    return super.noSuchMethod(
      Invocation.method(#removeUser, null),
      returnValueForMissingStub: Future.value(),
      returnValue: Future.value(),
    );
  }

  @override
  Future<void> saveUser(ChatUser user) {
    return super.noSuchMethod(
      Invocation.method(#saveUser, [user]),
      returnValueForMissingStub: Future.value(),
      returnValue: Future.value(),
    );
  }
}

class MockAuthService extends Mock implements AuthRepository {
  @override
  Future<ChatUser> signUpWithEmailAndPhone({
    required EmailAddress? emailAddress,
    required PhoneNumber? phoneNumber,
    required Password? password,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #signUpWithEmailAndPhone,
        null,
        {
          #emailAddress: emailAddress,
          #phoneNumber: phoneNumber,
          #password: password,
        },
      ),
      returnValue: Future.value(ChatUser.empty()),
      returnValueForMissingStub: Future.value(ChatUser.empty()),
    );
  }

  @override
  Future<ChatUser> signInWithEmail({
    required EmailAddress? emailAddress,
    required Password? password,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #signInWithEmail,
        null,
        {
          #emailAddress: emailAddress,
          #password: password,
        },
      ),
      returnValue: Future.value(ChatUser.empty()),
      returnValueForMissingStub: Future.value(ChatUser.empty()),
    );
  }

  @override
  Future<ChatUser> signInWithPhoneNumber({
    required PhoneNumber? phoneNumber,
    required Password? password,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #signInWithPhoneNumber,
        null,
        {
          #phoneNumber: phoneNumber,
          #password: password,
        },
      ),
      returnValue: Future.value(ChatUser.empty()),
      returnValueForMissingStub: Future.value(ChatUser.empty()),
    );
  }

  @override
  Future<ChatUser> getSignedInUser() {
    return super.noSuchMethod(
      Invocation.method(
        #getSignedInUser,
        null,
      ),
      returnValue: Future.value(ChatUser.empty()),
      returnValueForMissingStub: Future.value(ChatUser.empty()),
    );
  }

  @override
  Future<void> addInfoAboutUserToStream(ChatUser user) {
    return super.noSuchMethod(
      Invocation.method(
        #addInfoAboutUserToStream,
        [user],
      ),
      returnValue: Future.value(ChatUser.empty()),
      returnValueForMissingStub: Future.value(ChatUser.empty()),
    );
  }
}

class MockImageUploadService extends Mock implements ImageUploadService {
  @override
  Future<void> uploadProfileImage({
    required MyPickedFile? profileImage,
    required String? uid,
  }) {
    return super.noSuchMethod(
      Invocation.method(#uploadProfileImage, null, {
        #profileImage: profileImage,
        #uid: uid,
      }),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }

  @override
  Future<String> getProfileImageUrl({required String? uid}) {
    return super.noSuchMethod(
      Invocation.method(#getProfileImageUrl, null, {
        #uid: uid,
      }),
      returnValue: Future.value(''),
      returnValueForMissingStub: Future.value(''),
    );
  }
}

class MockNetworkService extends Mock implements NetworkInfo {
  @override
  Future<bool> get isConnected => super.noSuchMethod(
        Invocation.getter(
          #isConnected,
        ),
        returnValue: Future.value(false),
        returnValueForMissingStub: Future.value(false),
      );
}
