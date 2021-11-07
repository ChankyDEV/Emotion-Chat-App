import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/services/permission/permission_service.dart';
import 'package:flutter/material.dart';

import '../../domain/services/image_service.dart';

class ImageServiceImpl implements ImageService {
  final ImageRepository imageRepository;
  final PermissionService permissionHandler;

  ImageServiceImpl({
    required this.imageRepository,
    required this.permissionHandler,
  });

  @override
  Future<Either<Failure, MyPickedFile>> getImageFromCamera() async => getImage(
      onPermissionCheck: () => permissionHandler.getCameraPermission(),
      onGetImage: () => imageRepository.getImageFromCamera(),
      permissionFailureMessage: 'User didnt grant the camera usage permission');

  @override
  Future<Either<Failure, MyPickedFile>> getImageFromGallery() async => getImage(
      onPermissionCheck: () => permissionHandler.getGalleryPermission(),
      onGetImage: () => imageRepository.getImageFromGallery(),
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

  @override
  Future<String> getProfileImageUrl({required String? uid}) async =>
      await imageRepository.getProfileImageUrl(uid: uid);

  @override
  Future<void> uploadProfileImage({
    required MyPickedFile? profileImage,
    required String? uid,
  }) async =>
      await imageRepository.uploadProfileImage(
        profileImage: profileImage,
        uid: uid,
      );
}
