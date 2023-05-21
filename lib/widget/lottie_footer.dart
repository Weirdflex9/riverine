import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// 自定义Footer
class LottieFooter extends Footer {
  /// Key
  final Key? key;

  /// 方位
  final AlignmentGeometry? alignment;

  /// 提示加载文字
  final String? loadText;

  /// 准备加载文字
  final String? loadReadyText;

  /// 正在加载文字
  final String? loadingText;

  /// 加载完成文字
  final String? loadedText;

  /// 加载失败文字
  final String? loadFailedText;

  /// 没有更多文字
  final String? noMoreText;

  /// 背景颜色
  final Color bgColor;

  /// 字体颜色
  final Color textColor;

  /// 字号
  final double? textFontSize;

  LottieFooter({
    double extent = 60.0,
    double triggerDistance = 70.0,
    bool float = false,
    Duration? completeDuration = const Duration(seconds: 1),
    bool enableInfiniteLoad = true,
    bool enableHapticFeedback = true,
    bool overScroll = false,
    bool safeArea = true,
    EdgeInsets? padding,
    this.key,
    this.alignment,
    this.loadText,
    this.loadReadyText,
    this.loadingText,
    this.loadedText,
    this.loadFailedText,
    this.noMoreText,
    this.bgColor = Colors.transparent,
    this.textColor = Colours.text_999,
    this.textFontSize,
  }) : super(
          extent: extent,
          triggerDistance: triggerDistance,
          float: float,
          completeDuration: completeDuration,
          enableInfiniteLoad: enableInfiniteLoad,
          enableHapticFeedback: enableHapticFeedback,
          overScroll: overScroll,
          safeArea: safeArea,
          padding: padding,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration? completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore) {
    return CustomFooterWidget(
      key: key,
      classicalFooter: this,
      loadState: loadState,
      pulledExtent: pulledExtent,
      loadTriggerPullDistance: loadTriggerPullDistance,
      loadIndicatorExtent: loadIndicatorExtent,
      axisDirection: axisDirection,
      float: float,
      completeDuration: completeDuration,
      enableInfiniteLoad: enableInfiniteLoad,
      success: success,
      noMore: noMore,
    );
  }
}

/// 经典Footer组件
class CustomFooterWidget extends StatefulWidget {
  final LottieFooter classicalFooter;
  final LoadMode loadState;
  final double pulledExtent;
  final double loadTriggerPullDistance;
  final double loadIndicatorExtent;
  final AxisDirection axisDirection;
  final bool float;
  final Duration? completeDuration;
  final bool enableInfiniteLoad;
  final bool success;
  final bool noMore;

  CustomFooterWidget(
      {Key? key,
      required this.loadState,
      required this.classicalFooter,
      required this.pulledExtent,
      required this.loadTriggerPullDistance,
      required this.loadIndicatorExtent,
      required this.axisDirection,
      required this.float,
      this.completeDuration,
      required this.enableInfiniteLoad,
      required this.success,
      required this.noMore})
      : super(key: key);

  @override
  CustomFooterWidgetState createState() => CustomFooterWidgetState();
}

class CustomFooterWidgetState extends State<CustomFooterWidget> with TickerProviderStateMixin<CustomFooterWidget> {
  // 是否到达触发加载距离
  bool _overTriggerDistance = false;

  bool get overTriggerDistance => _overTriggerDistance;

  set overTriggerDistance(bool over) {
    if (_overTriggerDistance != over) {
      _overTriggerDistance ? _readyController.forward() : _restoreController.forward();
    }
    _overTriggerDistance = over;
  }

  /// 文本
  String get _loadText {
    return widget.classicalFooter.loadText ?? '上拉开始加载';
  }

  String get _loadReadyText {
    return widget.classicalFooter.loadReadyText ?? '松开立即加载';
  }

  String get _loadingText {
    return widget.classicalFooter.loadingText ?? '正在加载中…';
  }

  String get _loadedText {
    return widget.classicalFooter.loadedText ?? '';
  }

  String get _loadFailedText {
    return widget.classicalFooter.loadFailedText ?? '';
  }

  String get _noMoreText {
    return widget.classicalFooter.noMoreText ?? '';
  }

  // 动画
  late AnimationController _readyController;
  late Animation<double> _readyAnimation;
  late AnimationController _restoreController;
  late Animation<double> _restoreAnimation;

  // 显示文字
  String get _showText {
    if (widget.noMore) return _noMoreText;
    if (widget.enableInfiniteLoad) {
      if (widget.loadState == LoadMode.loaded || widget.loadState == LoadMode.inactive || widget.loadState == LoadMode.drag) {
        return _finishedText;
      } else {
        return _loadingText;
      }
    }
    switch (widget.loadState) {
      case LoadMode.load:
        return _loadingText;
      case LoadMode.armed:
        return _loadingText;
      case LoadMode.loaded:
        return _finishedText;
      case LoadMode.done:
        return _finishedText;
      default:
        if (overTriggerDistance) {
          return _loadReadyText;
        } else {
          return _loadText;
        }
    }
  }

  // 加载结束文字
  String get _finishedText {
    if (!widget.success) return _loadFailedText;
    if (widget.noMore) return _noMoreText;
    return _loadedText;
  }

  @override
  void initState() {
    super.initState();
    _readyController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _readyAnimation = Tween(begin: 0.5, end: 1.0).animate(_readyController);
    _readyAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _readyController.reset();
      }
    });
    _restoreController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _restoreAnimation = Tween(begin: 1.0, end: 0.5).animate(_restoreController);
    _restoreAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _restoreController.reset();
      }
    });
  }

  @override
  void dispose() {
    _readyController.dispose();
    _restoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 是否为垂直方向
    bool isVertical = widget.axisDirection == AxisDirection.down || widget.axisDirection == AxisDirection.up;
    // 是否反向
    bool isReverse = widget.axisDirection == AxisDirection.up || widget.axisDirection == AxisDirection.left;
    // 是否到达触发加载距离
    overTriggerDistance = widget.loadState != LoadMode.inactive && widget.pulledExtent >= widget.loadTriggerPullDistance;
    return Stack(
      children: <Widget>[
        Positioned(
          top: !isVertical
              ? 0.0
              : !isReverse
                  ? 0.0
                  : null,
          bottom: !isVertical
              ? 0.0
              : isReverse
                  ? 0.0
                  : null,
          left: isVertical
              ? 0.0
              : !isReverse
                  ? 0.0
                  : null,
          right: isVertical
              ? 0.0
              : isReverse
                  ? 0.0
                  : null,
          child: Container(
            alignment: widget.classicalFooter.alignment ??
                (isVertical
                    ? !isReverse
                        ? Alignment.topCenter
                        : Alignment.bottomCenter
                    : isReverse
                        ? Alignment.centerRight
                        : Alignment.centerLeft),
            width: !isVertical
                ? widget.loadIndicatorExtent > widget.pulledExtent
                    ? widget.loadIndicatorExtent
                    : widget.pulledExtent
                : double.infinity,
            height: isVertical
                ? widget.loadIndicatorExtent > widget.pulledExtent
                    ? widget.loadIndicatorExtent
                    : widget.pulledExtent
                : double.infinity,
            color: widget.classicalFooter.bgColor,
            child: SizedBox(
              height: isVertical ? widget.loadIndicatorExtent : double.infinity,
              width: !isVertical ? widget.loadIndicatorExtent : double.infinity,
              child: _buildContent(isVertical, isReverse),
            ),
          ),
        ),
      ],
    );
  }

  // 构建显示内容
  Widget _buildContent(bool isVertical, bool isReverse) {
    return isVertical
        ? Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (widget.loadState == LoadMode.load || widget.loadState == LoadMode.armed) && !widget.noMore
                    ? Lottie.asset(
                        'assets/lottie/loading.json',
                        width: 120.w,
                        height: 120.w,
                        repeat: true,
                        reverse: true,
                        animate: true,
                      )
                    : SizedBox(),
                Text(
                  _showText,
                  style: TextStyle(
                    fontSize: widget.classicalFooter.textFontSize ?? 28.sp,
                    color: widget.classicalFooter.textColor,
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: widget.loadState == LoadMode.load || widget.loadState == LoadMode.armed
                ? Lottie.asset(
                    'assets/lottie/loading.json',
                    width: 120.w,
                    height: 120.w,
                    repeat: true,
                    reverse: true,
                    animate: true,
                  )
                : SizedBox(),
          );
  }
}
