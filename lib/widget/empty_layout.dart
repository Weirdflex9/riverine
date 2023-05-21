import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';

class EmptyLayout extends StatelessWidget {
  const EmptyLayout({
    Key? key,
    this.hintText,
    this.hintTextSize,
    this.hintTextColor,
    this.paddingTop,
  }) : super(key: key);

  final String? hintText;
  final double? hintTextSize;
  final Color? hintTextColor;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadSvg(
            'svg/null_data',
            width: 150.w,
            color: Colours.text_999,
          ),
          SizedBox(height: 20.w),
          Text(
            hintText ?? '暂无数据',
            style: TextStyle(
              fontSize: hintTextSize ?? 30.sp,
              color: hintTextColor ?? Colours.text_999,
            ),
          ),
        ],
      ),
    );
  }
}
