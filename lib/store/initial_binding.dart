import 'package:get/get.dart';

import 'store.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StoreLogic>(StoreLogic(), permanent: true);
  }
}
