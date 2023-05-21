import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverine/res/export.dart';
import 'package:riverine/widget/double_tap_exit.dart';
import 'package:riverine/widget/my_bottom_bar.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {

  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return DoubleTapBackExitApp(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: state.pageController,
          itemCount: state.tabPage.length,
          itemBuilder: (context, index) => state.tabPage[index],
        ),
        bottomNavigationBar: GetBuilder<MainLogic>(
            id: 'bottomBar',
            builder: (logic) {
              return MyBottomBar(
                items: state.tabBar,
                iconSize: 48.w,
                textFontSize: 20.sp,
                currentIndex: state.selectedIndex.value,
                textFocusColor: Colours.primary,
                textUnfocusColor: Colours.text_999,
                onTap: (int index) => logic.selectTab(index),
              );
            }),
      ),
    );
  }
}
