import 'package:get/get.dart';

class LanguageState {
  List<Map<String, String>> languages = [
    {'name': 'Follow System'.tr, 'value': ''},
    {'name': '简体中文', 'value': 'zh_CN'},
    {'name': 'English', 'value': 'en_US'},
  ];
  late int index;

  LanguageState() {
    ///Initialize variables
    index = 0;
  }
}
