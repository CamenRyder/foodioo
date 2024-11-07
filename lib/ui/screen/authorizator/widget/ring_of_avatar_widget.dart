import 'package:flutter/material.dart';
import 'package:foodioo/core/theme/app_colors.dart';

import '../../../../core/constants/constant_stataue.dart';
import '../../../General/image_customize_widget.dart';

enum RingStyle { normal, vip }

class RingOfAvatarWidget extends StatelessWidget {
  final String url;
  final RingStyle ringStyle;
  final double? sizeAvatar;
  final double? widthRing;
  const RingOfAvatarWidget(
      {super.key,
      this.ringStyle = RingStyle.normal,
      required this.url,
      this.widthRing,
      this.sizeAvatar});

  @override
  Widget build(BuildContext context) {
    final sizeYourAvatar = MediaQuery.of(context).size.width / 8;
    final colorRinger = ringStyle == RingStyle.normal
        ? AppColors.green
        : Theme.of(context).primaryColor;

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colorRinger, width: widthRing ?? 3),
        ),
        child: CustomImage(
          url: url,
          size: sizeAvatar ?? sizeYourAvatar,
          radius: AppConstant.radiusExtra,
        ));
  }
}
