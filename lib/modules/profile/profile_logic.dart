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
    final _applyResult = await PermissionUtil.awaitPermission([Permission.camera]);
    if (_applyResult == ApplyResultType.success) {
      var _scanResult = await Get.toNamed(RouteConfig.scan);
    } else if (_applyResult == ApplyResultType.failure) {
      Toast.show('申请相机权限失败');
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
