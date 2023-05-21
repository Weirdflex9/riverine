import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:riverine/widget/lottie_footer.dart';

/// 已包装头部和尾部的EasyRefresh
class CustomEasyRefresh extends StatelessWidget {
  const CustomEasyRefresh({
    Key? key,
    required this.child,
    this.controller,
    this.onRefresh,
    this.onLoad,
    this.emptyWidget,
  }) : super(key: key);

  final Widget child;
  final EasyRefreshController? controller;
  final OnRefreshCallback? onRefresh;
  final OnLoadCallback? onLoad;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: controller,
      child: child,
      onRefresh: onRefresh,
      onLoad: onLoad,
      emptyWidget: emptyWidget,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      header: MaterialHeader(),
      footer: LottieFooter(),
    );
  }
}
