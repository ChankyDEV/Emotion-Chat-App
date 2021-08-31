import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/services/image_upload/image_upload_service.dart';

class AmazonImageUploadService implements ImageUploadService {
  @override
  Future<String> getProfileImageUrl({required String? uid}) {
    // TODO: implement getProfileImageUrl
    throw UnimplementedError();
  }

  @override
  Future<void> uploadProfileImage({required MyPickedFile? profileImage, required String? uid}) {
    // TODO: implement uploadProfileImage
    throw UnimplementedError();
  }


}
