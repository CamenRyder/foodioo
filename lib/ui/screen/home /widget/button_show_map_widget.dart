import 'package:flutter/material.dart';
import 'package:foodioo/Core/routes/routes_name.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';

class ButtonShowMapWidget extends StatelessWidget {
  final double marginIconLcoation = 7;
  final double sizeIconLocationMarker = 14;

  const ButtonShowMapWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NavigatorNames.FOOD_MAP);
      },
      child: Container(
        padding: const EdgeInsets.all(AppConstant.paddingIndicator),
        margin:
            EdgeInsets.only(top: marginIconLcoation, right: marginIconLcoation),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Container(
          padding: const EdgeInsets.all(AppConstant.paddingIcon),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.grey50),
          child: Assets.icons.locationMarker.svg(
              color: AppColors.black,
              height: sizeIconLocationMarker,
              width: sizeIconLocationMarker),
        ),
      ),
    );
  }
}
