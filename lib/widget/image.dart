import 'package:riverine/res/export.dart';
import 'package:riverine/util/image_util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 图片加载（支持本地与网络图片）
class LoadImage extends StatelessWidget {
  const LoadImage(
    this.url, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.holderImgFit = BoxFit.cover,
    this.format = ImageFormat.png,
    this.radius,
    this.border,
    this.holderImg,
  }) : super(key: key);

  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BoxFit holderImgFit;
  final ImageFormat format;
  final double? radius;
  final Border? border;
  final String? holderImg;

  @override
  Widget build(BuildContext context) {
    if (TextUtil.isEmpty(url) || url!.startsWith('http')) {
      return ExtendedImage.network(
        url ?? '',
        cache: true,
        retries: 0,
        border: border,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius ?? 0),
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.completed:
              return ExtendedRawImage(
                fit: fit,
                width: width,
                height: height,
                image: state.extendedImageInfo?.image,
              );
            case LoadState.loading:
              return SizedBox(
                height: height,
                width: width,
              );
            default:
              return holderImg == null
                      ? SizedBox(
                          height: height,
                          width: width,
                        )
                      : LoadAssetImage(
                          holderImg!,
                          width: width,
                          height: height,
                          fit: holderImgFit,
                        );
          }
        },
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return LoadAssetImage(
        url!,
        height: height,
        width: width,
        fit: fit,
        format: format,
      );
    }
  }
}

/// 加载本地资源图片
class LoadAssetImage extends StatelessWidget {
  const LoadAssetImage(
    this.image, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.format = ImageFormat.png,
    this.color,
  }) : super(key: key);

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageFormat format;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageUtil.getImgPath(image, format: format),
      height: height,
      width: width,
      fit: fit,
      color: color,
      excludeFromSemantics: true,
    );
  }
}

///加载本地svg资源
class LoadSvg extends StatelessWidget {
  const LoadSvg(
    this.image, {
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final String image;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImageUtil.getImgPath(image, format: ImageFormat.svg),
      width: width,
      height: height,
      color: color,
    );
  }
}
