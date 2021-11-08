import 'package:emotion_chat/features/permission/domain/entities/my_permission_status.dart';

abstract class PermissionInfo {
  Future<MyPermissionStatus> getCameraPermission();
  Future<MyPermissionStatus> getGalleryPermission();
}
