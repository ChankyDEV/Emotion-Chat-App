// Mocks generated by Mockito 5.0.9 from annotations
// in emotion_chat/test/repositories/image_picker_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:emotion_chat/data/enums/my_permission_status.dart' as _i6;
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart'
    as _i2;
import 'package:emotion_chat/services/image_picker/image_picker_service.dart'
    as _i3;
import 'package:emotion_chat/services/permission/permission_service.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMyPickedFile extends _i1.Fake implements _i2.MyPickedFile {}

/// A class which mocks [IImagePickerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIImagePickerService extends _i1.Mock
    implements _i3.ImagePickerService {
  MockIImagePickerService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.MyPickedFile> getImageFromGallery() =>
      (super.noSuchMethod(Invocation.method(#getImageFromGallery, []),
              returnValue: Future<_i2.MyPickedFile>.value(_FakeMyPickedFile()))
          as _i4.Future<_i2.MyPickedFile>);
  @override
  _i4.Future<_i2.MyPickedFile> getImageFromCamera() =>
      (super.noSuchMethod(Invocation.method(#getImageFromCamera, []),
              returnValue: Future<_i2.MyPickedFile>.value(_FakeMyPickedFile()))
          as _i4.Future<_i2.MyPickedFile>);
}

/// A class which mocks [IPermissionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPermissionService extends _i1.Mock
    implements _i5.PermissionService {
  MockIPermissionService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i6.MyPermissionStatus> getCameraPermission() =>
      (super.noSuchMethod(Invocation.method(#getCameraPermission, []),
              returnValue: Future<_i6.MyPermissionStatus>.value(
                  _i6.MyPermissionStatus.denied))
          as _i4.Future<_i6.MyPermissionStatus>);
  @override
  _i4.Future<_i6.MyPermissionStatus> getGalleryPermission() =>
      (super.noSuchMethod(Invocation.method(#getGalleryPermission, []),
              returnValue: Future<_i6.MyPermissionStatus>.value(
                  _i6.MyPermissionStatus.denied))
          as _i4.Future<_i6.MyPermissionStatus>);
}
