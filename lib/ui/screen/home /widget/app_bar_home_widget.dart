import 'package:flutter/material.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/core/theme/app_colors.dart';
import 'package:foodioo/core/theme/app_typography.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';
import 'package:foodioo/ui/screen/home%20/widget/foodioo_widget.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/icon_button_customize.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstant.paddingContent),
      child: Row(
        children: [
          const FoodiooWidget(),
          Expanded(child: SizedBox()),
          Row(
            children: [
              IconButtonCustomize(
                icon: Assets.icons.creditCard.svg(color: AppColors.white),
                onTap: () {
                  MessageToast.showToast(context, "Test");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
