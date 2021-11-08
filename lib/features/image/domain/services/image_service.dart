import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/image/domain/entities/picked_file.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

abstract class ImageService {
  Future<Either<Failure, MyPickedFile>> getImageFromGallery();
  Future<Either<Failure, MyPickedFile>> getImageFromCamera();
  Future<void> uploadProfileImage({
    required MyPickedFile? profileImage,
    required String? uid,
  });

  Future<String> getProfileImageUrl({required String? uid});
}
