import 'dart:async';

import 'package:riverine/res/colors.dart';
import 'package:riverine/util/device_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class ThemeUtil {
  static StreamSubscription? _subscription;

  /// 设置NavigationBar样式
  static void setSystemNavigationBar() {
    /// 主题切换动画（AnimatedTheme）时间为200毫秒，延时设置导航栏颜色，这样过渡相对自然。
    _subscription?.cancel();
    _subscription = Stream.value(1).delay(const Duration(milliseconds: 200)).listen((_) {
      setSystemBarStyle();
    });
  }

  /// 设置StatusBar、NavigationBar样式。(仅针对安卓)
  static void setSystemBarStyle() {
    if (Device.isAndroid) {
      final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colours.primary,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: Colours.bg,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.white,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
    );
  }
}
