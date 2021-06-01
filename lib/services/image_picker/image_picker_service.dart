import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/services/image_picker/i_image_picker_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IImagePickerService)
class ImagePickerService implements IImagePickerService {
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
