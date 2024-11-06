import 'package:flutter/material.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';

class IconButtonCustomize extends StatelessWidget {
  const IconButtonCustomize(
      {super.key,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.iconPadding,
      this.sizeTotalIcon});

  final VoidCallback onTap;
  final Widget icon;
  final Color? backgroundColor;
  final double? sizeTotalIcon;
  final EdgeInsetsGeometry? iconPadding;
  final double totalSizeIcon =
      AppConstant.sizeIconMedium + AppConstant.paddingIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
            height: sizeTotalIcon ?? totalSizeIcon,
            width: sizeTotalIcon ?? totalSizeIcon,
            padding:
                iconPadding ?? const EdgeInsets.all(AppConstant.paddingIcon),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor ?? Theme.of(context).primaryColor),
            child: icon));
  }
}
