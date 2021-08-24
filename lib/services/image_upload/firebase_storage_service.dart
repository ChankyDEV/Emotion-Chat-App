import 'dart:io';

import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/services/image_upload/i_image_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageUploadService implements IImageUploadService {
  FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<String> getProfileImageUrl({
    required String? uid,
  }) async {
    final ref = 'users/${uid}.jpg';
    return await _storage.ref(ref).getDownloadURL();
  }

  @override
  Future<void> uploadProfileImage(
      {required MyPickedFile? profileImage, required String? uid}) async {
    final ref = 'users/${uid}.jpg';
    final file = File(profileImage!.path);
    try {
      await _storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw ImageUploadException(message: 'Cant add photo');
    }
  }
}
