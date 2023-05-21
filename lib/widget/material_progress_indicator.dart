import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverine/res/colors.dart';

class MaterialProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? strokeWidth;
  final double? size;

  MaterialProgressIndicator({this.color, this.strokeWidth, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 40.w,
        height: size ?? 40.w,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 3.w,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? Colours.primary,
          ),
        ),
      ),
    );
  }
}
