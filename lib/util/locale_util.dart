import 'dart:ui';

import 'package:riverine/res/export.dart';
import 'package:get/get.dart';

///语言工具类
class LocaleUtil {
  static Future<bool> updateLocale(String lang) async {
    if (lang == 'en_US') {
      await GetStorage().write(Constant.keyLanguage, 'en_US');
      Get.updateLocale(Locale('en', 'US'));
    } else if (lang == 'zh_CN') {
      await GetStorage().write(Constant.keyLanguage, 'zh_CN');
      Get.updateLocale(Locale('zh', 'CN'));
    } else if (lang == '') {
      await GetStorage().write(Constant.keyLanguage, '');
      Get.updateLocale(window.locale);
    }
    return true;
  }

  static Locale getDefault() {
    final _lang = GetStorage().read<String>(Constant.keyLanguage);
    if (_lang == 'en_US') {
      return Locale('en', 'US');
    } else if (_lang == 'zh_CN') {
      return Locale('zh', 'CN');
    } else {
      return window.locale;
    }
  }
}
