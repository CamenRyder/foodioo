import 'package:flutter/material.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_avatar_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_background_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_fullname_widget.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';

class ButtonEditWidget extends StatelessWidget {
  const ButtonEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ButtonUpdateFullnameWidget(),
                  const Divider(
                    height: 0.1,
                    color: AppColors.grey,
                  ),
                  const ButtonUpdateAvatarWidget(),
                  const Divider(
                    height: 0.1,
                    color: AppColors.grey,
                  ),
                  const ButtonUpdateBackgroundWidget()
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
          // boxShadow: [
          //   // BoxShadow(
          //   //   color: Colors.grey.withOpacity(0.5),
          //   //   spreadRadius: 2,
          //   //   blurRadius: 5,
          //   //   offset: const Offset(0, 3),
          //   // ),
          // ],
        ),
        margin: const EdgeInsets.symmetric(
            vertical: AppConstant.paddingContent,
            horizontal: AppConstant.paddingHorizontalApp),
        padding: const EdgeInsets.symmetric(
            vertical: AppConstant.paddingContent + 5,
            horizontal: AppConstant.paddingHorizontalApp + 5),
        child: Text(
          "Chỉnh sửa cá nhân",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
