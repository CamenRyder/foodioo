import 'package:flutter/material.dart';
import 'package:foodioo/core/theme/app_colors.dart';

class CirclePointMarkerWidget extends StatelessWidget {
  final bool isMain;

  const CirclePointMarkerWidget({super.key, this.isMain = false});
  @override
  Widget build(BuildContext context) {
    double sizeWidget = 12;
    return Container(
      height: sizeWidget,
      width: sizeWidget,
      decoration: BoxDecoration(
        color: isMain ? AppColorsLight.primary : AppColorsLight.textHint,
        shape: BoxShape.circle,
      ),
    );
  }
}
