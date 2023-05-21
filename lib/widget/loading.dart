import 'package:riverine/res/export.dart';

class Loading {
  static void show() {
    if (!EasyLoading.isShow) {
      EasyLoading.show();
    }
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
