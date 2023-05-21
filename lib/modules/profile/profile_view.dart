import 'package:riverine/res/export.dart';
import 'package:riverine/store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverine/util/image_util.dart';

import 'profile_logic.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final store = Get.find<StoreLogic>();
    final logic = Get.put(ProfileLogic());

    return Scaffold(
      appBar: TitleBar(
        title: 'Profile'.tr,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.w),
              child: Row(
                children: [
                  ClipOval(
                    child: LoadAssetImage(
                      'logo',
                      format: ImageFormat.jpg,
                      width: 90.w,
                      height: 90.w,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Text(
                      '已登录用户',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.w),
            InkWell(
              onTap: logic.toCameraAlbum,
              child: Container(
                color: Colors.white,
                height: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  children: [
                    LoadSvg(
                      'svg/upload',
                      width: 40.w,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      'Camera Album'.tr,
                      style: TextStyle(
                        color: Colours.text_333,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25.w,
                      color: Colours.text_ccc,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colours.divider,
              height: 1.w,
              width: double.infinity,
            ),
            InkWell(
              onTap: logic.toScan,
              child: Container(
                color: Colors.white,
                height: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  children: [
                    LoadSvg(
                      'svg/pickup',
                      width: 40.w,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      'Scan'.tr,
                      style: TextStyle(
                        color: Colours.text_333,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25.w,
                      color: Colours.text_ccc,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colours.divider,
              height: 1.w,
              width: double.infinity,
            ),
            InkWell(
              onTap: logic.toLanguage,
              child: Container(
                color: Colors.white,
                height: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  children: [
                    LoadSvg(
                      'svg/language',
                      width: 40.w,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      'Language'.tr,
                      style: TextStyle(
                        color: Colours.text_333,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25.w,
                      color: Colours.text_ccc,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colours.divider,
              height: 1.w,
              width: double.infinity,
            ),
            InkWell(
              onTap: logic.logout,
              child: Container(
                color: Colors.white,
                height: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  children: [
                    LoadSvg(
                      'svg/logout',
                      width: 40.w,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      'Log Out'.tr,
                      style: TextStyle(
                        color: Colours.text_333,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25.w,
                      color: Colours.text_ccc,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
