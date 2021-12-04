import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/image/data/services/image_service_impl.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/permission/domain/entities/my_permission_status.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:emotion_chat/utils/data/utils/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/mocks.dart';

void main() {
  late ImageServiceImpl imageService;
  late MockImageRepository imageRepository;
  late MockPermissionInfo permissionInfo;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    imageRepository = MockImageRepository();
    permissionInfo = MockPermissionInfo();
    imageService = ImageServiceImpl(
      imageRepository: imageRepository,
      permissionHandler: permissionInfo,
    );
  });
  final image = MyPickedFile('some_path_file');
  final noCameraPermissonFailure =
      ImagePickFailure('User didnt grant the camera usage permission');
  final noGalleryPermissonFailure =
      ImagePickFailure('User didnt grant the gallery usage permission');
  final requestPermissionFailure =
      ImagePickFailure('Something went wrong with requesting permission');
  final getImageFailure =
      ImagePickFailure('Something went wrong with getting image');

  group('getImageFromGallery', () {
    test('should requst permission grant', () async {
      when(permissionInfo.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(imageRepository.getImageFromGallery())
          .thenAnswer((_) async => image);
      await imageService.getImageFromGallery();
      verify(permissionInfo.getGalleryPermission());
    });

    test(
        'should forward call to imagePickerService when the permission is granted',
        () async {
      when(permissionInfo.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(imageRepository.getImageFromGallery())
          .thenAnswer((_) async => image);
      await imageService.getImageFromGallery();
      verify(imageRepository.getImageFromGallery());
    });
    test(
        'should not forward call to imagePickerService when the permission is denied',
        () async {
      when(permissionInfo.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);

      await imageService.getImageFromGallery();
      verify(permissionInfo.getGalleryPermission());
      verifyZeroInteractions(imageRepository);
    });

    test('should return MyPickedFile when the permission is granted', () async {
      when(permissionInfo.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(imageRepository.getImageFromGallery())
          .thenAnswer((_) async => image);

      final result = await imageService.getImageFromGallery();
      verify(permissionInfo.getGalleryPermission());
      verify(imageRepository.getImageFromGallery());
      verifyNoMoreInteractions(permissionInfo);
      verifyNoMoreInteractions(imageRepository);
      expect(result, equals(right(image)));
    });

    test('should return ImagePickFailure when permission is denied', () async {
      when(permissionInfo.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);
      final result = await imageService.getImageFromGallery();
      expect(result, equals(left(noGalleryPermissonFailure)));
    });

    test(
        'should return ImagePickFailure when permissionService throws PermissionException',
        () async {
      when(permissionInfo.getGalleryPermission()).thenThrow(PermissionException(
          message: "Something went wrong with requesting permission"));
      final result = await imageService.getImageFromGallery();
      expect(result, equals(left(requestPermissionFailure)));
    });
    test(
        'should return ImagePickFailure when imagePickerService throws ImagePickException',
        () async {
      when(permissionInfo.getGalleryPermission()).thenThrow(ImagePickException(
          message: "Something went wrong with getting image"));
      final result = await imageService.getImageFromGallery();
      expect(result, equals(left(getImageFailure)));
    });
  });

  group('getImageFromCamera', () {
    test('should requst permission grant', () async {
      when(permissionInfo.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(imageRepository.getImageFromCamera()).thenAnswer((_) async => image);
      await imageService.getImageFromCamera();
      verify(permissionInfo.getCameraPermission());
    });

    test(
        'should forward call to imagePickerService when the permission is granted',
        () async {
      when(permissionInfo.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(imageRepository.getImageFromCamera()).thenAnswer((_) async => image);
      await imageService.getImageFromCamera();
      verify(permissionInfo.getCameraPermission());
      verify(imageRepository.getImageFromCamera());
    });
    test(
        'should not forward call to imagePickerService when the permission is denied',
        () async {
      when(permissionInfo.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);

      await imageService.getImageFromCamera();
      verifyZeroInteractions(imageRepository);
    });

    test('should return MyPickedFile when the permission is granted', () async {
      when(permissionInfo.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(imageRepository.getImageFromCamera()).thenAnswer((_) async => image);

      final result = await imageService.getImageFromCamera();
      verify(permissionInfo.getCameraPermission());
      verify(imageRepository.getImageFromCamera());
      verifyNoMoreInteractions(permissionInfo);
      verifyNoMoreInteractions(imageRepository);
      expect(result, equals(right(image)));
    });

    test('should return ImagePickFailure when permission is denied', () async {
      when(permissionInfo.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);
      final result = await imageService.getImageFromCamera();
      expect(result, equals(left(noCameraPermissonFailure)));
    });

    test(
        'should return ImagePickFailure when permissionService throws PermissionException',
        () async {
      when(permissionInfo.getCameraPermission()).thenThrow(PermissionException(
          message: "Something went wrong with requesting permission"));
      final result = await imageService.getImageFromCamera();
      expect(result, equals(left(requestPermissionFailure)));
    });
    test(
        'should return ImagePickFailure when imagePickerService throws ImagePickException',
        () async {
      when(permissionInfo.getCameraPermission()).thenThrow(ImagePickException(
          message: "Something went wrong with getting image"));
      final result = await imageService.getImageFromCamera();
      expect(result, equals(left(getImageFailure)));
    });
  });
}
