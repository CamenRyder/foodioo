import 'package:flutter/material.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';

import '../../../../core/theme/app_colors.dart';

class IntroWidget extends StatelessWidget {
  final Widget image;

  const IntroWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double marginTop = MediaQuery.sizeOf(context).height * 0.15;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: marginTop,
            ),
            image,
            const SpacingVerticalWidget(
              height: 350,
            ),
          ],
        ));
  }
}
