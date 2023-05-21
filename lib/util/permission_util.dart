import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  // 申请权限
  static Future<bool> requestAuthPermission(Permission permission) async {
    //获取当前的权限
    var status = await permission.status;
    if (status == PermissionStatus.granted || status == PermissionStatus.limited) {
      return true;
    } else {
      //未授权则发起一次申请
      status = await permission.request();
      if (status == PermissionStatus.granted || status == PermissionStatus.limited) {
        return true;
      } else {
        return false;
      }
    }
  }
}
