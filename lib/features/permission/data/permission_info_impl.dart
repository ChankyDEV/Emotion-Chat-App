import 'package:emotion_chat/features/permission/domain/entities/my_permission_status.dart';
import 'package:emotion_chat/features/permission/domain/permission_info.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionInfoImpl implements PermissionInfo {
  @override
  Future<MyPermissionStatus> getCameraPermission() async {
    final status = await Permission.camera.request();
    return _mapToMyPermissionStatus(status);
  }

  @override
  Future<MyPermissionStatus> getGalleryPermission() async {
    final status = await Permission.photos.request();
    return _mapToMyPermissionStatus(status);
  }

  _mapToMyPermissionStatus(PermissionStatus status) {
    final listOfMyStatuses = [
      MyPermissionStatus.denied,
      MyPermissionStatus.granted,
      MyPermissionStatus.limited,
      MyPermissionStatus.permanentlyDenied,
      MyPermissionStatus.restricted,
      MyPermissionStatus.undetermined,
    ];
    return listOfMyStatuses[status.index];
  }
}
