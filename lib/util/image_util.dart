import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageUtil {
  static String format(String? url) {
    if (url == null) {
      return '';
    }
    if (url.startsWith('https://img.xxx.cn') && !url.contains('x-oss-process')) {
      return '$url?x-oss-process=image/quality,q_70/format,webp';
    } else {
      return url;
    }
  }

  static ImageProvider getAssetImage(String name, {ImageFormat format = ImageFormat.png}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.${format.value}';
  }
}

enum ImageFormat { png, jpg, gif, webp, svg }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp', 'svg'][index];
}
