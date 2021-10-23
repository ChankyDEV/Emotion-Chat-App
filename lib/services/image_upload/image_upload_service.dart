import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';

abstract class ImageUploadService {
  Future<void> uploadProfileImage({
    required MyPickedFile? profileImage,
    required String? uid,
  });

  Future<String> getProfileImageUrl({required String? uid});
}
