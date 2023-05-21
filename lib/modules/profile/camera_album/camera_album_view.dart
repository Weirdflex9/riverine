import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverine/res/export.dart';

import 'camera_album_logic.dart';

class CameraAlbumPage extends StatelessWidget {
  final logic = Get.find<CameraAlbumLogic>();
  final state = Get.find<CameraAlbumLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBar(
          title: 'Camera Album'.tr,
          actionName: 'Confirm'.tr,
          actionPressed: logic.confirm,
        ),
        body: Container(
          padding: EdgeInsets.all(40.w),
          child: GetBuilder<CameraAlbumLogic>(builder: (_) {
            return Container(
              width: double.infinity,
              child: Wrap(
                spacing: 20.w,
                runSpacing: 20.w,
                children: List.generate(
                  state.items.length < 4 ? state.items.length + 1 : state.items.length,
                      (index) {
                    double imageWidth = (1.sw - 120.w) / 3;
                    return index == state.items.length
                        ? InkWell(
                      onTap: logic.addImage,
                      child: Container(
                        width: imageWidth,
                        height: imageWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.w),
                        ),
                        child: Center(
                          child: LoadAssetImage(
                            'add',
                            width: 40.w,
                          ),
                        ),
                      ),
                    )
                        : SizedBox(
                      width: imageWidth,
                      height: imageWidth,
                      child: Stack(
                        children: [
                          LoadImage(
                            state.items[index].url,
                            radius: 16.w,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: InkWell(
                                onTap: () => logic.deleteImage(index),
                                child: LoadAssetImage(
                                  'del',
                                  width: 28.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      );
  }
}
