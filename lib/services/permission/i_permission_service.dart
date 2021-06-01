import 'package:emotion_chat/constants/data.dart';

abstract class IPermissionService {
  Future<MyPermissionStatus> getCameraPermission();
  Future<MyPermissionStatus> getGalleryPermission();
}
