import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/services/image_picker/i_image_picker_service.dart';
import 'package:emotion_chat/services/permission/i_permission_service.dart';
import 'package:flutter/material.dart';

import 'i_image_picker_repository.dart';

class ImagePickerRepository implements IImagePickerRepository {
  final IImagePickerService imagePickerService;
  final IPermissionService permissionHandler;

  ImagePickerRepository(
      {required this.imagePickerService, required this.permissionHandler});

  @override
  Future<Either<Failure, MyPickedFile>> getImageFromCamera() async => getImage(
      onPermissionCheck: () => permissionHandler.getCameraPermission(),
      onGetImage: () => imagePickerService.getImageFromCamera(),
      permissionFailureMessage: 'User didnt grant the camera usage permission');

  @override
  Future<Either<Failure, MyPickedFile>> getImageFromGallery() async => getImage(
      onPermissionCheck: () => permissionHandler.getGalleryPermission(),
      onGetImage: () => imagePickerService.getImageFromGallery(),
      permissionFailureMessage:
          'User didnt grant the gallery usage permission');

  @visibleForTesting
  Future<Either<Failure, MyPickedFile>> getImage(
      {required Function onPermissionCheck,
      required Function onGetImage,
      required String permissionFailureMessage}) async {
    try {
      final status = await onPermissionCheck();
      if (status == MyPermissionStatus.granted) {
        final image = await onGetImage();
        return right(image);
      } else {
        return left(ImagePickFailure(permissionFailureMessage));
      }
    } on PermissionException catch (e) {
      return left(ImagePickFailure(e.message));
    } on ImagePickException catch (e) {
      return left(ImagePickFailure(e.message));
    }
  }
}
