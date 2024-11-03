import 'package:flutter/material.dart';

import '../../core/constants/constant_stataue.dart';

class SvgGenSizeWidget extends StatelessWidget {
  final Widget icon;
  final bool isLargeSize;

  const SvgGenSizeWidget(
      {super.key, required this.icon, this.isLargeSize = false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          isLargeSize ? AppConstant.sizeIconLarge : AppConstant.sizeIconMedium,
      child: icon,
    );
  }
}
