import 'package:flutter/material.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/customize_button_widget.dart';

class ButtonUpdateBackgroundWidget extends StatelessWidget {
  const ButtonUpdateBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    return ListTile(
        leading: SvgGenSizeWidget(
          icon: Assets.icons.imagePicker
              .svg(color: Theme.of(context).primaryColor),
        ),
        title: Text(
          'Cập nhập ảnh bìa',
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
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Center(
                        child: Text(
                          "Cập nhật ảnh bìa",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SpacingVerticalWidget(
                        height: 35,
                      ),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppConstant.radiusLarge),
                              border: Border.all(
                                  color: colorIcon,
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                            ),
                            padding: const EdgeInsets.all(
                                AppConstant.paddingComponent),
                            height: sizeIcon,
                            width: sizeIcon,
                            child:
                                Assets.icons.imagePicker.svg(color: colorIcon)),
                      ),
                      const Expanded(child: SizedBox()),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppConstant.radiusLarge),
                              border: Border.all(
                                  color: colorIcon,
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                            ),
                            padding: const EdgeInsets.all(
                                AppConstant.paddingComponent),
                            height: sizeIcon,
                            width: sizeIcon,
                            child: Assets.icons.camera.svg(color: colorIcon)),
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
        });
  }
}
