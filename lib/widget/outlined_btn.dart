import 'package:flutter/material.dart';

class OutlinedBtn extends StatelessWidget {
  final String? text;
  final EdgeInsets? padding;
  final Size? size;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final double? radius;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final Color borderColor;
  final double borderWidth;

  OutlinedBtn({
    this.text,
    this.padding,
    this.size,
    this.style,
    this.onPressed,
    this.radius,
    this.child,
    this.alignment,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: size,
        padding: padding,
        alignment: alignment,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        side: BorderSide(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      child: child ??
          Text(
            text ?? '按钮',
            style: style,
          ),
    );
  }
}
