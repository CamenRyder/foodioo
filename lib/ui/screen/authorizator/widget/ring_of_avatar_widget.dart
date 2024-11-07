import 'package:flutter/material.dart';
import 'package:foodioo/core/theme/app_colors.dart';

import '../../../../core/constants/constant_stataue.dart';
import '../../../General/image_customize_widget.dart';

enum RingStyle { normal, vip }

class RingOfAvatarWidget extends StatelessWidget {
  final String url;
  final RingStyle ringStyle;
  const RingOfAvatarWidget(
      {super.key, this.ringStyle = RingStyle.normal, required this.url});

  @override
  Widget build(BuildContext context) {
    final sizeYourAvatar = MediaQuery.of(context).size.width / 8;
    final colorRinger = ringStyle == RingStyle.normal
        ? AppColors.green
        : Theme.of(context).primaryColor;

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colorRinger, width: 4),
        ),
        child: CustomImage(
          url: url,
          size: sizeYourAvatar,
          radius: AppConstant.radiusExtra,
        ));
  }
}
