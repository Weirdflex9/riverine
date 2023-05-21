import 'package:get/get.dart';

import 'camera_album_logic.dart';

class CameraAlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CameraAlbumLogic());
  }
}
