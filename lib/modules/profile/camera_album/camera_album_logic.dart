import 'dart:io';

import 'package:riverine/entity/image_pick_entity.dart';
import 'package:riverine/res/export.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import 'camera_album_state.dart';

class CameraAlbumLogic extends GetxController {
  final CameraAlbumState state = CameraAlbumState();

  void addImage() async {
    Get.bottomSheet(
      CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(
              'Camera'.tr,
            ),
            onPressed: () async {
              Get.back();
              bool hasPermission = await PermissionUtil.requestAuthPermission(Permission.camera);
              if (hasPermission) {
                final result = await CameraPicker.pickFromCamera(Get.context!);
                if (result != null) {
                  File? _file = await result.file;
                  if (_file != null) {
                    Loading.show();
                    final _fileNames = _file.path.split('/');
                    final storageRef = FirebaseStorage.instance
                        .ref()
                        .child('delivery')
                        .child('${DateTime.now().microsecondsSinceEpoch}_${Uri.encodeComponent(_fileNames[_fileNames.length - 1])}');
                    try {
                      var _compressed = await FlutterImageCompress.compressWithFile(
                        _file.absolute.path,
                        minWidth: 600,
                        quality: 50,
                      );
                      if (_compressed != null) {
                        await storageRef.putData(_compressed);
                        String _url = await storageRef.getDownloadURL();
                        Loading.dismiss();
                        state.items.add(ImagePickEntity()..url = _url);
                        update();
                      }
                    } on FirebaseException catch (e) {
                      Toast.show(e.message ?? 'image upload error');
                      Loading.dismiss();
                    }
                  }
                }
              } else {
                Get.dialog(
                  Warning(
                    content: 'Have not permission of camera'.tr,
                    confirm: 'Jump to Settings'.tr,
                    onCancel: () {},
                    onConfirm: () async {
                      await openAppSettings();
                    },
                  ),
                  barrierDismissible: false,
                );
              }
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Album'.tr,
            ),
            onPressed: () async {
              Get.back();
              List<AssetEntity>? assets = await AssetPicker.pickAssets(
                Get.context!,
                pickerConfig: AssetPickerConfig(
                  selectedAssets: [],
                  maxAssets: 4 - state.items.length,
                  requestType: RequestType.image,
                  specialItemPosition: SpecialItemPosition.none,
                  limitedPermissionOverlayPredicate: (permissionState) => false,
                ),
              );
              if (ObjectUtil.isNotEmpty(assets)) {
                List<ImagePickEntity> _list = [];
                Loading.show();
                for (AssetEntity assetEntity in assets!) {
                  File? _file = await assetEntity.originFile;
                  if (_file == null) {
                    return;
                  }
                  final _fileNames = _file.path.split('/');
                  final storageRef = FirebaseStorage.instance
                      .ref()
                      .child('delivery')
                      .child('${DateTime.now().microsecondsSinceEpoch}_${Uri.encodeComponent(_fileNames[_fileNames.length - 1])}');
                  try {
                    var _compressed = await FlutterImageCompress.compressWithFile(
                      _file.absolute.path,
                      minWidth: 600,
                      quality: 50,
                    );
                    if (_compressed != null) {
                      await storageRef.putData(_compressed);
                      String _url = await storageRef.getDownloadURL();
                      _list.add(ImagePickEntity()..url = _url);
                    }
                  } on FirebaseException catch (e) {
                    Toast.show(e.message ?? 'image upload error');
                    Loading.dismiss();
                    return;
                  }
                }
                Loading.dismiss();
                state.items.addAll(_list);
                update();
              }
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(),
          child: Text(
            'Cancel'.tr,
          ),
        ),
      ),
    );
  }

  void deleteImage(int index) {
    state.items.removeAt(index);
    update();
  }

  confirm() {
    //todo 提交
  }
}
