import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';

abstract class ImageRepository {
  Future<MyPickedFile> getImageFromGallery();

  Future<MyPickedFile> getImageFromCamera();

  Future<void> uploadProfileImage({
    required MyPickedFile? profileImage,
    required String? uid,
  });

  Future<String> getProfileImageUrl({required String? uid});
}
