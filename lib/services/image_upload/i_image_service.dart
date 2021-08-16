import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';

abstract class IImageUploadService {
  Future<String> generateProfileImageUrl(
      {required MyPickedFile? profileImage, required String? uid});
}
