import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/customize_button_widget.dart';
import '../../../General/message_over_screen.dart';
import '../../../General/spacing_vertical_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import 'update_image_profile_widget.dart';

class ButtonUpdateAvatarWidget extends StatelessWidget{
  const ButtonUpdateAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            final heightScreen = MediaQuery.sizeOf(context).height;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 
                  const Divider(
                    height: 0.1,
                    color: AppColors.grey,
                  ),
                  const UpdateImageProfileWidget(),
                  const Divider(
                    height: 0.1,
                    color: AppColors.grey,
                  ),
                  ListTile(
                      leading: SvgGenSizeWidget(
                        icon: Assets.icons.imagePicker
                            .svg(color: Theme.of(context).primaryColor),
                      ),
                      title: Text(
                        'Cập nhập ảnh đại diện',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onTap: () async {
                        Navigator.pop(context);
                        await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              double sizeIcon = heightScreen * 0.12;
                              final colorIcon = Theme.of(context).primaryColor;
                              return Container(
                                  height: heightScreen * 0.8,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 20),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Cập nhật ảnh đại diện",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                        const SpacingVerticalWidget(
                                          height: 35,
                                        ),
                                        Center(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppConstant
                                                            .radiusLarge),
                                                border: Border.all(
                                                    color: colorIcon,
                                                    width: 1,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside),
                                              ),
                                              padding: const EdgeInsets.all(
                                                  AppConstant.paddingComponent),
                                              height: sizeIcon,
                                              width: sizeIcon,
                                              child: Assets.icons.imagePicker
                                                  .svg(color: colorIcon)),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Center(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppConstant
                                                            .radiusLarge),
                                                border: Border.all(
                                                    color: colorIcon,
                                                    width: 1,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside),
                                              ),
                                              padding: const EdgeInsets.all(
                                                  AppConstant.paddingComponent),
                                              height: sizeIcon,
                                              width: sizeIcon,
                                              child: Assets.icons.camera
                                                  .svg(color: colorIcon)),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        CustomizeButtonWidget(
                                          onPressed: () {
                                            MessageToast.showToast(context);
                                          },
                                          title: "Cập nhật",
                                          isEnable: true,
                                        ),
                                      ]));
                            });
                      }),
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