import 'package:permission_handler/permission_handler.dart';
import 'package:riverine/res/export.dart';
import 'package:riverine/store/store.dart';
import 'package:get/get.dart';

import 'profile_state.dart';

class ProfileLogic extends GetxController {
  final ProfileState state = ProfileState();

  void logout() {
    Get.dialog(
      Warning(
        content: 'Are you sure to log out'.tr,
        onCancel: () {},
        onConfirm: () async {
          await StoreLogic.to.whenSignOut();
          Get.offAndToNamed(RouteConfig.login);
        },
      ),
      barrierDismissible: false,
    );
  }

  void toLanguage() {
    Get.toNamed(RouteConfig.language);
  }

  void toScan() async {
    bool hasPermission = await PermissionUtil.requestAuthPermission(Permission.camera);
    if (hasPermission) {
      var _scanResult = await Get.toNamed(RouteConfig.scan);
      //todo scan result
    } else {
      Get.dialog(
        Warning(
          content: 'Have not permission of camera'.tr,
          confirm: 'Jump to Settings'.tr,
          onCancel: () {},
          onConfirm: () async {
            await openAppSettings();
          },
        ),
        barrierDismissible: false,
      );
    }
  }

  void toCameraAlbum() {
    Get.toNamed(RouteConfig.cameraAlbum);
  }
}
