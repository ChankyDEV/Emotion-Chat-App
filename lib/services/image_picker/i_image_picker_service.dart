import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';

abstract class IImagePickerService {
  Future<MyPickedFile> getImageFromGallery();
  Future<MyPickedFile> getImageFromCamera();
}
