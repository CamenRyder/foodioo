import 'package:flutter/material.dart';
import 'package:foodioo/core/theme/assets.gen.dart';

import '../../../core/constants/constant_stataue.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

import '../../general/customize_button_widget.dart';
import '../../general/spacing_vertical_widget.dart';
import '../../general/svg_gen_size_widget.dart';
import 'widget/input_widget.dart';
import 'widget/login_text_widget.dart';
import 'widget/select_gender_widget.dart';

class RegisterAuthorizatorScreen extends StatelessWidget {
  final String headerScreen = "Tạo tài khoản mới";
  final double marginComponent = 20;
  final Color iconColor = AppColorsLight.primary;
  const RegisterAuthorizatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                  icon: SvgGenSizeWidget(
                      icon: Assets.icons.heart.svg(color: iconColor)),
                  controller: TextEditingController(),
                  hintText: "Tên đầy đủ",
                ),
                SpacingVerticalWidget(height: marginComponent),
                InputWidget(
                  icon: SvgGenSizeWidget(
                      icon: Assets.icons.heart.svg(color: iconColor)),
                  controller: TextEditingController(),
                  hintText: "Địa chỉ email",
                ),
                SpacingVerticalWidget(height: marginComponent),
                InputWidget(
                    icon: SvgGenSizeWidget(
                        icon: Assets.icons.heart.svg(color: iconColor)),
                    controller: TextEditingController(),
                    hintText: "Mật khẩu",
                    isPasswordTextField: true),
                SpacingVerticalWidget(height: marginComponent),
                SelectGenderWidget(
                  controller: TextEditingController(text: 'Nam'),
                ),
                const Expanded(child: SizedBox()),
                CustomizeButtonWidget(
                  onPressed: () {},
                  title: "Đăng ký",
                ),
                const SpacingVerticalWidget(height: 20),
                const LoginTextWidget()
              ],
            ),
          ),
        ));
  }
}
