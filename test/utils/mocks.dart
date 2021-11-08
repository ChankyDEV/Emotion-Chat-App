import 'package:emotion_chat/features/friend/domain/repositories/friends_repository.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/permission/domain/entities/my_permission_status.dart';
import 'package:emotion_chat/features/permission/domain/permission_info.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/domain/entities/user_props.dart';
import 'package:emotion_chat/features/user/domain/repositories/auth_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';

class MockPermissionInfo extends Mock implements PermissionInfo {
  @override
  Future<MyPermissionStatus> getCameraPermission() {
    return super.noSuchMethod(
      Invocation.method(#getCameraPermission, null),
      returnValueForMissingStub: Future.value(MyPermissionStatus.granted),
      returnValue: Future.value(MyPermissionStatus.granted),
    );
  }

  @override
  Future<MyPermissionStatus> getGalleryPermission() {
    return super.noSuchMethod(
      Invocation.method(#getGalleryPermission, null),
      returnValueForMissingStub: Future.value(MyPermissionStatus.granted),
      returnValue: Future.value(MyPermissionStatus.granted),
    );
  }
}

class MockUserRepository extends Mock implements UserRepository {
  @override
  Future<String> findUserUuidByEmail(String? email) async {
    return super.noSuchMethod(
      Invocation.method(#findUserUidByEmail, [email]),
      returnValueForMissingStub: Future.value('12345'),
      returnValue: Future.value('12345'),
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

class MockFriendsRepository extends Mock implements FriendsRepository {
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

class MockLocalRepository extends Mock implements LocalRepository {
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

class MockAuthRepository extends Mock implements AuthRepository {
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

class MockImageRepository extends Mock implements ImageRepository {
  @override
  Future<MyPickedFile> getImageFromGallery() {
    return super.noSuchMethod(
      Invocation.method(#getImageFromGallery, null),
      returnValue: Future.value(MyPickedFile('')),
      returnValueForMissingStub: Future.value(MyPickedFile('')),
    );
  }

  @override
  Future<MyPickedFile> getImageFromCamera() {
    return super.noSuchMethod(
      Invocation.method(#getImageFromCamera, null),
      returnValue: Future.value(MyPickedFile('')),
      returnValueForMissingStub: Future.value(MyPickedFile('')),
    );
  }

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

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Future<bool> get isConnected => super.noSuchMethod(
        Invocation.getter(
          #isConnected,
        ),
        returnValue: Future.value(false),
        returnValueForMissingStub: Future.value(false),
      );
}
