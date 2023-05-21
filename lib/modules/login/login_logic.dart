import 'package:riverine/res/export.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  void login() async {
    // String _account = state.formKey.currentState!.fields['account']?.value;
    // String _password = state.formKey.currentState!.fields['password']?.value;
    await GetStorage().write(Constant.keyToken, 'token值');
    Toast.showSuccess('Log In succeeded'.tr);
    Get.offNamed(RouteConfig.main);
  }

  void onFormChange() {
    state.formKey.currentState?.save();
    update(['login_btn']);
  }
}
