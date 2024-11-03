import 'package:flutter/material.dart';

import '../../../../core/constants/constant_stataue.dart';
import '../../../../core/theme/app_typography.dart';

class BottomSheetSelectWidget extends StatelessWidget {
  const BottomSheetSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.radiusExtra),
      ),
      height: MediaQuery.sizeOf(context).height / 6,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context, 1),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height / 14,
              width: MediaQuery.sizeOf(context).width,
              child: const Text(
                'Nam',
                style: AppTypographyLight.textContentBold,
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.pop(context, 2),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height / 14,
              width: MediaQuery.sizeOf(context).width,
              child: const Text(
                'Nữ',
                style: AppTypographyLight.textContentBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
