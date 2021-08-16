import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/services/permission/i_permission_service.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@LazySingleton(as: IPermissionService)
class PermissionService implements IPermissionService {
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
}
