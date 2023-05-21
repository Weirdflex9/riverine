import 'package:get/get.dart';

import 'scan_logic.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanLogic());
  }
}
