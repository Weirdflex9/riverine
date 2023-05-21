import 'package:get/get.dart';

import 'language_logic.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageLogic());
  }
}
