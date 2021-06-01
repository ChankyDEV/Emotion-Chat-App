import 'package:dartz/dartz.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:image_picker/image_picker.dart';

abstract class IImagePickerRepository {
  Future<Either<Failure, MyPickedFile>> getImageFromGallery();
  Future<Either<Failure, MyPickedFile>> getImageFromCamera();
}

class MyPickedFile extends PickedFile {
  MyPickedFile(String path) : super(path);
}
