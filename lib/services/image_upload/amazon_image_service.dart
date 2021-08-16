import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/services/image_upload/i_image_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IImageUploadService)
class AmazonImageUploadService implements IImageUploadService {
  @override
  Future<String> generateProfileImageUrl(
      {required MyPickedFile? profileImage, required String? uid}) async {
    throw UnimplementedError();
  }
}
