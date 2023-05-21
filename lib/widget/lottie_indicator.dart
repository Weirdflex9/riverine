import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieIndicator extends StatelessWidget {
  final double? size;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;

  LottieIndicator({this.height, this.size, this.alignment, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? double.infinity,
      alignment: alignment ?? Alignment.center,
      padding: padding,
      child: Lottie.asset(
        'assets/lottie/loading.json',
        width: size ?? 100,
        height: size ?? 100,
        repeat: true,
        reverse: true,
        animate: true,
      ),
    );
  }
}
