import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  void selectTab(int currentIndex) async {
    state.selectedIndex.value = currentIndex;
    state.pageController.jumpToPage(currentIndex);
    update(['bottomBar']);
  }
}
