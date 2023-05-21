import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language_logic.dart';

class LanguagePage extends StatelessWidget {
  final logic = Get.find<LanguageLogic>();
  final state = Get.find<LanguageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TitleBar(
        title: 'Language'.tr,
        actionName: 'Done'.tr,
        actionPressed: logic.done,
      ),
      body: GetBuilder<LanguageLogic>(builder: (_) {
        return ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => Container(
            width: double.infinity,
            height: 1.w,
            color: Colours.divider,
            margin: EdgeInsets.symmetric(horizontal: 30.w),
          ),
          itemCount: state.languages.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            onTap: () => logic.confirm(index),
            title: Text(
              state.languages[index]['name']!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Visibility(
              visible: state.index == index,
              child: Icon(
                Icons.check,
                color: Colours.primary,
                size: 40.w,
              ),
            ),
          ),
        );
      }),
    );
  }
}
