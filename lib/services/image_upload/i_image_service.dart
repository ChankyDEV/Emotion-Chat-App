import 'package:flutter/material.dart';

abstract class IImageUploadService {
  Future<String> generateProfileImageUrl(
      {required Image? profileImage, required String? uid});
}
