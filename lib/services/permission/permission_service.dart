import 'package:emotion_chat/constants/data.dart';

abstract class PermissionService {
  Future<MyPermissionStatus> getCameraPermission();
  Future<MyPermissionStatus> getGalleryPermission();
}
