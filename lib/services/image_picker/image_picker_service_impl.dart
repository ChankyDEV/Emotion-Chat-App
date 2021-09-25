import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/services/image_picker/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerServiceImpl implements ImagePickerService {
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
}