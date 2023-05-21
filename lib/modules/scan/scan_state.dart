import 'package:get/get.dart';
import 'package:scan/scan.dart';

class ScanState {
  ScanController controller = ScanController();
  String? title;

  ScanState() {
    Map<String, dynamic>? args = Get.arguments;
    if (args != null && args.containsKey('title')) {
      title = args['title'];
    }
  }
}
