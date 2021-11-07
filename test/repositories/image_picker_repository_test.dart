import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/image/data/services/image_service_impl.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/features/image/domain/services/image_service.dart';
import 'package:emotion_chat/services/permission/permission_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_picker_repository_test.mocks.dart';

@GenerateMocks([ImageRepository, PermissionService])
void main() {
  late ImageServiceImpl imagePickerRepository;
  late MockImagePickerService mockImagePickerService;
  late MockPermissionService mockPermissionHandler;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockImagePickerService = MockImagePickerService();
    mockPermissionHandler = MockPermissionService();
    imagePickerRepository = ImageServiceImpl(
        imageRepository: mockImagePickerService,
        permissionHandler: mockPermissionHandler);
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
      when(mockPermissionHandler.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(mockImagePickerService.getImageFromGallery())
          .thenAnswer((_) async => image);
      await imagePickerRepository.getImageFromGallery();
      verify(mockPermissionHandler.getGalleryPermission());
    });

    test(
        'should forward call to imagePickerService when the permission is granted',
        () async {
      when(mockPermissionHandler.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(mockImagePickerService.getImageFromGallery())
          .thenAnswer((_) async => image);
      await imagePickerRepository.getImageFromGallery();
      verify(mockImagePickerService.getImageFromGallery());
    });
    test(
        'should not forward call to imagePickerService when the permission is denied',
        () async {
      when(mockPermissionHandler.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);

      await imagePickerRepository.getImageFromGallery();
      verify(mockPermissionHandler.getGalleryPermission());
      verifyZeroInteractions(mockImagePickerService);
    });

    test('should return MyPickedFile when the permission is granted', () async {
      when(mockPermissionHandler.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(mockImagePickerService.getImageFromGallery())
          .thenAnswer((_) async => image);

      final result = await imagePickerRepository.getImageFromGallery();
      verify(mockPermissionHandler.getGalleryPermission());
      verify(mockImagePickerService.getImageFromGallery());
      verifyNoMoreInteractions(mockPermissionHandler);
      verifyNoMoreInteractions(mockImagePickerService);
      expect(result, equals(right(image)));
    });

    test('should return ImagePickFailure when permission is denied', () async {
      when(mockPermissionHandler.getGalleryPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);
      final result = await imagePickerRepository.getImageFromGallery();
      expect(result, equals(left(noGalleryPermissonFailure)));
    });

    test(
        'should return ImagePickFailure when permissionService throws PermissionException',
        () async {
      when(mockPermissionHandler.getGalleryPermission()).thenThrow(
          PermissionException(
              message: "Something went wrong with requesting permission"));
      final result = await imagePickerRepository.getImageFromGallery();
      expect(result, equals(left(requestPermissionFailure)));
    });
    test(
        'should return ImagePickFailure when imagePickerService throws ImagePickException',
        () async {
      when(mockPermissionHandler.getGalleryPermission()).thenThrow(
          ImagePickException(
              message: "Something went wrong with getting image"));
      final result = await imagePickerRepository.getImageFromGallery();
      expect(result, equals(left(getImageFailure)));
    });
  });

  group('getImageFromCamera', () {
    test('should requst permission grant', () async {
      when(mockPermissionHandler.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(mockImagePickerService.getImageFromCamera())
          .thenAnswer((_) async => image);
      await imagePickerRepository.getImageFromCamera();
      verify(mockPermissionHandler.getCameraPermission());
    });

    test(
        'should forward call to imagePickerService when the permission is granted',
        () async {
      when(mockPermissionHandler.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(mockImagePickerService.getImageFromCamera())
          .thenAnswer((_) async => image);
      await imagePickerRepository.getImageFromCamera();
      verify(mockPermissionHandler.getCameraPermission());
      verify(mockImagePickerService.getImageFromCamera());
    });
    test(
        'should not forward call to imagePickerService when the permission is denied',
        () async {
      when(mockPermissionHandler.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);

      await imagePickerRepository.getImageFromCamera();
      verifyZeroInteractions(mockImagePickerService);
    });

    test('should return MyPickedFile when the permission is granted', () async {
      when(mockPermissionHandler.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.granted);
      when(mockImagePickerService.getImageFromCamera())
          .thenAnswer((_) async => image);

      final result = await imagePickerRepository.getImageFromCamera();
      verify(mockPermissionHandler.getCameraPermission());
      verify(mockImagePickerService.getImageFromCamera());
      verifyNoMoreInteractions(mockPermissionHandler);
      verifyNoMoreInteractions(mockImagePickerService);
      expect(result, equals(right(image)));
    });

    test('should return ImagePickFailure when permission is denied', () async {
      when(mockPermissionHandler.getCameraPermission())
          .thenAnswer((_) async => MyPermissionStatus.denied);
      final result = await imagePickerRepository.getImageFromCamera();
      expect(result, equals(left(noCameraPermissonFailure)));
    });

    test(
        'should return ImagePickFailure when permissionService throws PermissionException',
        () async {
      when(mockPermissionHandler.getCameraPermission()).thenThrow(
          PermissionException(
              message: "Something went wrong with requesting permission"));
      final result = await imagePickerRepository.getImageFromCamera();
      expect(result, equals(left(requestPermissionFailure)));
    });
    test(
        'should return ImagePickFailure when imagePickerService throws ImagePickException',
        () async {
      when(mockPermissionHandler.getCameraPermission()).thenThrow(
          ImagePickException(
              message: "Something went wrong with getting image"));
      final result = await imagePickerRepository.getImageFromCamera();
      expect(result, equals(left(getImageFailure)));
    });
  });
}
