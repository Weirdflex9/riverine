import 'package:riverine/res/export.dart';
import 'package:get/get.dart';

import 'language_state.dart';

class LanguageLogic extends GetxController {
  final LanguageState state = LanguageState();

  @override
  void onInit() {
    super.onInit();
    final _currentLang = GetStorage().read<String>(Constant.keyLanguage);
    if (_currentLang == '') {
      state.index = 0;
    } else if (_currentLang == 'zh_CN') {
      state.index = 1;
    } else if (_currentLang == 'en_US') {
      state.index = 2;
    }
  }

  void confirm(int index) async {
    if (index == state.index) {
      return;
    }
    state.index = index;
    update();
  }

  void done() async {
    await LocaleUtil.updateLocale(state.languages[state.index]['value']!);
    Get.offAllNamed(RouteConfig.main);
  }
}
