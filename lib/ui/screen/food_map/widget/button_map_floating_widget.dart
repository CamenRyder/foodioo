import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonMapFloatingWidget extends StatelessWidget {
  const ButtonMapFloatingWidget({super.key});
  final double paddingButton = 12.0;
  final radiusButton = const Radius.circular(AppConstant.radiusLarge);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstant.paddingVerticalApp),
      margin: const EdgeInsets.only(bottom: AppConstant.paddingHorizontalApp),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: radiusButton, bottomLeft: radiusButton)),
                padding: EdgeInsets.all(paddingButton),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgGenSizeWidget(
                        icon: Assets.icons.arrowLeft.svg(color: Colors.black)),
                    const Text(
                      "Quay lại",
                      style: AppTypographyLight.textContentBold,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.black,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: radiusButton, bottomRight: radiusButton)),
                padding: EdgeInsets.all(paddingButton),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgGenSizeWidget(
                        icon:
                            Assets.icons.deviceMobile.svg(color: Colors.black)),
                    const Text(
                      "Vị trí hiện tại",
                      style: AppTypographyLight.textContentBold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
