import 'dart:io';

import 'package:riverine/res/export.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'scan_state.dart';

class ScanLogic extends GetxController {
  final ScanState state = ScanState();

  void scanResult(String trackingNumber) async {
    state.controller.pause();
    Get.back(result: trackingNumber);
  }

  void album() async {
    List<AssetEntity>? assets = await AssetPicker.pickAssets(
      Get.context!,
      pickerConfig: AssetPickerConfig(
        selectedAssets: [],
        maxAssets: 1,
        requestType: RequestType.image,
        specialItemPosition: SpecialItemPosition.none,
        limitedPermissionOverlayPredicate: (permissionState) => false,
      ),
    );
    if (ObjectUtil.isNotEmpty(assets)) {
      File? file = await assets!.first.originFile;
      if (file != null) {
        String? result = await Scan.parse(file.path);
        if (ObjectUtil.isEmpty(result)) {
          Toast.show('No result scanned');
        } else {
          scanResult(result!);
        }
      }
    }
  }
}
