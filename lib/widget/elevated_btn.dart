import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Size? size;
  final double? elevation;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final double? radius;
  final Widget? child;
  final AlignmentGeometry? alignment;

  ElevatedBtn({
    this.text,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.size,
    this.elevation,
    this.style,
    this.onPressed,
    this.radius,
    this.child,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.transparent),
          minimumSize: MaterialStateProperty.all(size),
          padding: MaterialStateProperty.all(padding ?? EdgeInsets.zero),
          elevation: MaterialStateProperty.all(elevation ?? 0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 0))),
          alignment: alignment,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child ??
            Text(
              text ?? '按钮',
              style: style,
            ),
      ),
    );
  }
}
