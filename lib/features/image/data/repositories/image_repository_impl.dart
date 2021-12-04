import 'dart:io';

import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepositoryImpl implements ImageRepository {
  FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<MyPickedFile> getImageFromCamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    return MyPickedFile(image!.path);
  }

  @override
  Future<MyPickedFile> getImageFromGallery() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    return MyPickedFile(image!.path);
  }

  @override
  Future<String> getProfileImageUrl({
    required String? uid,
  }) async {
    final ref = 'users/${uid}.jpg';
    return await _storage.ref(ref).getDownloadURL();
  }

  @override
  Future<void> uploadProfileImage({
    required MyPickedFile? profileImage,
    required String? uid,
  }) async {
    final ref = 'users/${uid}.jpg';
    final file = File(profileImage!.path);
    try {
      await _storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw ImageUploadException(message: 'Cant add photo');
    }
  }
}
