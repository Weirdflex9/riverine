import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// 标题栏（自定义appbar）
class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({
    Key? key,
    this.backgroundColor = Colours.primary, //主题颜色
    this.title = '', //标题内容
    this.actionName = '', //右边（仅限单个文字）按钮名称
    this.backImg, //返回按钮图片
    this.backPressed, //返回按钮点击事件
    this.actionPressed, //右边（仅限单个文字）的点击事件
    this.titleColor = Colors.white, //标题颜色
    this.titleFontSize, //标题字号
    this.backColor, //返回按钮颜色
    this.actionWidget, //右边
    this.bottomWidget, //底部
    this.customWidget, //完全自定义appbar
    this.hideBottomLine = true, //底部分割线
  }) : super(key: key);

  final Color backgroundColor;
  final String title;
  final Widget? backImg;
  final String actionName;
  final Function()? backPressed;
  final Function()? actionPressed;
  final Color titleColor;
  final double? titleFontSize;
  final Color? backColor;
  final Widget? actionWidget;
  final Widget? bottomWidget;
  final Widget? customWidget;
  final bool hideBottomLine;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        color: backgroundColor,
        child: SafeArea(
          child: customWidget ??
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      title.isEmpty ? '' : title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleFontSize ?? 34.sp,
                        fontWeight: FontWeight.w500,
                        color: titleColor,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 100.w),
                  ),
                  if (Get.routing.current != RouteConfig.main)
                    InkWell(
                      onTap: backPressed ?? Get.back,
                      child: backImg ??
                          Container(
                            height: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: LoadAssetImage(
                              'back',
                              width: 40.w,
                              height: 40.w,
                              color: Colors.white,
                            ),
                          ),
                    ),
                  if (actionWidget != null)
                    Positioned(
                      right: 0,
                      child: actionWidget!,
                    )
                  else if (actionName.isNotEmpty)
                    Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: actionPressed,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.w),
                          alignment: Alignment.center,
                          child: Text(
                            actionName,
                            key: const Key('actionName'),
                            style: TextStyle(
                              fontSize: 26.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (bottomWidget != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: bottomWidget!,
                    ),
                  if (!hideBottomLine)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: 1.w,
                        color: Colours.divider,
                      ),
                    )
                ],
              ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(98.w);
}
