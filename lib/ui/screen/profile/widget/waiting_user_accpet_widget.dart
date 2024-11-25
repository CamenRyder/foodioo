import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/user_model.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/constants/constant_stataue.dart';
import '../../../General/image_customize_widget.dart';
import '../../../General/spacing_horizontal_widget.dart';

class WaitingUserAccpetWidget extends StatelessWidget {
  const WaitingUserAccpetWidget({super.key, this.model});
  final UserModel? model;
  @override
  Widget build(BuildContext context) {
    double widthTabbar = MediaQuery.sizeOf(context).width / 3 - 60;
    final heighScreen = MediaQuery.sizeOf(context).height;
    final sizeAvatar = widthTabbar / 1.5 + 12;
    String urlImageTemp =
        'https://i.pinimg.com/550x/38/d0/e7/38d0e70f02cbef89d1968e3770977a6b.jpg';
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.paddingContent,
          vertical: AppConstant.paddingComponent),
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(AppConstant.radiusLarge)),
      padding: const EdgeInsets.symmetric(
          vertical: AppConstant.paddingContent + 2,
          horizontal: AppConstant.paddingHorizontalApp),
      child: Row(children: [
        CustomImage(
          radius: 120,
          url: urlImageTemp,
          size: sizeAvatar,
        ),
        const SpacingHorizontalWidget(
          width: AppConstant.paddingButton,
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Nagato",
              style: TextStyle(
                color: AppColorsLight.textContent,
                fontSize: AppConstant.textSizeButton,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Hủy bỏ",
              style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ))
      ]),
    );
  }
}
