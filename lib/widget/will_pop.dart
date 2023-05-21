import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyWillPop extends StatelessWidget {
  final Widget child;
  final bool isForbidBack;

  const MyWillPop({
    Key? key,
    required this.child,
    this.isForbidBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isForbidBack) {
      return WillPopScope(
          child: child,
          onWillPop: () async {
            return Future.value(false);
          });
    } else if (GetPlatform.isAndroid || GetPlatform.isFuchsia) {
      return WillPopScope(
          child: child,
          onWillPop: () async {
            if (EasyLoading.instance.w != null) {
              return Future.value(false);
            }
            return Future.value(true);
          });
    } else {
      return child;
    }
  }
}
