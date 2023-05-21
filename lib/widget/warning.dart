import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Warning extends StatelessWidget {
  final String content;
  final Function? onCancel;
  final Function? onConfirm;
  final String? cancel;
  final String? confirm;

  const Warning({
    Key? key,
    this.content = '',
    this.onCancel,
    this.onConfirm,
    this.cancel,
    this.confirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget contentWidget = ConstrainedBox(
      constraints: BoxConstraints(minHeight: 160.w),
      child: Container(
        height: 200.w,
        padding: EdgeInsets.all(20.w),
        child: Center(
          child: Text(
            content,
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    final Widget bottomButtonWidget = Row(
      children: <Widget>[
        if (onCancel != null)
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
                onCancel!();
              },
              child: Container(
                height: 100.w,
                child: Center(
                  child: Text(
                    cancel ?? 'Cancel'.tr,
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Colours.text_999,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (onConfirm != null && onCancel != null)
          Container(
            height: 100.w,
            width: 1.w,
            color: Colours.divider,
          ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (onConfirm != null) {
                onConfirm!();
              }
              Get.back();
            },
            child: Container(
              height: 100.w,
              child: Center(
                child: Text(
                  confirm ?? 'Confirm'.tr,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    final Widget body = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          contentWidget,
          Container(
            width: double.infinity,
            height: 1.w,
            color: Colours.divider,
          ),
          bottomButtonWidget,
        ],
      ),
    );

    return Center(
      child: SizedBox(
        width: 540.w,
        child: body,
      ),
    );
  }
}
