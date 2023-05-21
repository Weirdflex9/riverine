import 'package:riverine/res/export.dart';

class Toast {
  static void show(String message, {EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.center}) {
    if (TextUtil.isEmpty(message)) {
      return;
    }
    EasyLoading.showToast(message, toastPosition: toastPosition, duration: Duration(seconds: 1));
  }

  static void showSuccess(String message) {
    if (TextUtil.isEmpty(message)) {
      return;
    }
    EasyLoading.showSuccess(message);
  }
}
