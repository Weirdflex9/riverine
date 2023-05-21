import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverine/modules/home/home_view.dart';
import 'package:riverine/modules/map/map_view.dart';
import 'package:riverine/modules/profile/profile_view.dart';
import 'package:riverine/widget/keep_alive_page.dart';
import 'package:riverine/widget/my_bottom_bar.dart';

class MainState {
  final pageController = PageController();
  late RxInt selectedIndex;
  late List<Widget> tabPage;
  late List<BottomBarItem> tabBar;

  MainState() {
    selectedIndex = 0.obs;
    tabPage = [
      keepAlivePage(HomePage()),
      keepAlivePage(MapPage()),
      keepAlivePage(ProfilePage()),
    ];
    tabBar = [
      BottomBarItem('home', 'home_s', 'Home'.tr),
      BottomBarItem('map', 'map_s', 'Map'.tr),
      BottomBarItem('profile', 'profile_s', 'Profile'.tr),
    ];
  }
}
