import 'package:emotion_chat/constants/data.dart';

abstract class PermissionInfo {
  Future<MyPermissionStatus> getCameraPermission();
  Future<MyPermissionStatus> getGalleryPermission();
}
