import 'package:riverine/firebase_options.dart';
import 'package:riverine/res/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:firebase_core/firebase_core.dart';

class Application {
  Application._();

  static final _instance = Application._();

  factory Application.getInstance() => _instance;

  void init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..contentPadding = const EdgeInsets.all(15)
      ..toastPosition = EasyLoadingToastPosition.center
      ..lineWidth = 2
      ..indicatorSize = 30
      ..userInteractions = false;
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  }
}
