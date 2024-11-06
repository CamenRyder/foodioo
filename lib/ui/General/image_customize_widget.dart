import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/Core/theme/app_colors.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';

class CustomImage extends StatelessWidget {
  final String url;
  final String name;
  final double size;
  final double radius;
  final double fontSize;
  final BoxFit fit;
  const CustomImage(
      {super.key,
      required this.url,
      this.name = '',
      required this.size,
      this.radius = 0,
      this.fontSize = AppConstant.textSizeContent,
      this.fit = BoxFit.cover});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        fit: fit,
        errorWidget: (context, error, stackTrace) {
          return name.isEmpty
              ? Assets.avatar.appAvatar.image(width: size, height: size)
              : Container(
                  width: size,
                  height: size,
                  color: AppColors.pink.withOpacity(0.4),
                  child: Center(
                    child: Text(
                        name.trim().isEmpty
                            ? ''
                            : (name.trim().split(' ').first[0] +
                                name.trim().split(' ').last[0]),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600)),
                  ));
        },
      ),
    );
  }
}

class CustomImageForLangscope extends StatelessWidget {
  final String url;
  final String name;
  final double height;
  final double? width;
  final double radius;
  final double fontSize;
  final BoxFit fit;
  const CustomImageForLangscope(
      {super.key,
      required this.url,
      this.name = '',
      required this.height,
      this.width,
      this.radius = 0,
      this.fontSize = 16,
      this.fit = BoxFit.contain});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width ?? height,
        height: height,
        fit: fit,
        errorWidget: (context, error, stackTrace) {
          return name.isEmpty
              ? Assets.avatar.appAvatar
                  .image(width: width ?? height, height: height)
              : Container(
                  width: width ?? height,
                  height: height,
                  color: AppColors.pink.withOpacity(0.4),
                  child: Center(
                    child: Text(
                        name.trim().isEmpty
                            ? ''
                            : (name.trim().split(' ').first[0] +
                                name.trim().split(' ').last[0]),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600)),
                  ));
        },
      ),
    );
  }
}
