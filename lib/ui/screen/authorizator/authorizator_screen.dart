import 'package:flutter/material.dart';
import 'package:foodioo/core/theme/app_colors.dart';
import 'package:foodioo/core/theme/app_typography.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';

import '../../../core/constants/constant_stataue.dart';
import '../../../core/theme/assets.gen.dart';
import '../../general/customize_button_widget.dart';
import '../../general/svg_gen_size_widget.dart';
import 'widget/input_widget.dart';
import 'widget/register_text_widget.dart';

class AuthorizatorScreen extends StatelessWidget {
  const AuthorizatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBack = false;
    final String headerScreen = isBack ? "Chào mừng trở lại" : "Đăng nhập";
    return Scaffold(
        backgroundColor: AppColorsLight.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.paddingHorizontalApp),
            child: Column(
              children: [
                const SpacingVerticalWidget(height: 80),
                Center(
                  child: Text(
                    headerScreen,
                    style: AppTypographyLight.textHeader,
                  ),
                ),
                const SpacingVerticalWidget(height: 20),
                InputWidget(
                  icon: SvgGenSizeWidget(icon: Assets.icons.mail.svg()),
                  controller: TextEditingController(),
                  hintText: "Tài khoản",
                ),
                InputWidget(
                    icon: SvgGenSizeWidget(icon: Assets.icons.key.svg()),
                    controller: TextEditingController(),
                    hintText: "Mật khẩu",
                    isPasswordTextField: true),
                const SpacingVerticalWidget(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Quên mật khẩu",
                          style: AppTypographyLight.textContentPrimaryBold,
                        ),
                      )),
                ),
                const Expanded(child: SizedBox()),
                CustomizeButtonWidget(
                  onPressed: () {},
                  title: "Đăng nhập",
                  isEnable: false,
                ),
                const SpacingVerticalWidget(height: 20),
                const RegisterTextWidget()
              ],
            ),
          ),
        ));
  }
}
