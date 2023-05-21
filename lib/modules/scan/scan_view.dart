import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

import 'scan_logic.dart';

class ScanPage extends StatelessWidget {
  final logic = Get.put(ScanLogic());
  final state = Get.find<ScanLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TitleBar(
        title: state.title ?? 'Scan'.tr,
        actionName: 'Album'.tr,
        actionPressed: logic.album,
      ),
      body: ScanView(
        controller: state.controller,
        scanAreaScale: 0.8,
        scanLineColor: Colours.primary,
        onCapture: (data) => logic.scanResult(data),
      ),
    );
  }
}
