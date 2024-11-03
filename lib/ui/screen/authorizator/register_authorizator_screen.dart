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

class RegisterAuthorizatorScreen extends StatefulWidget {
  const RegisterAuthorizatorScreen({super.key});

  @override
  State<RegisterAuthorizatorScreen> createState() =>
      _RegisterAuthorizatorScreenState();
}

class _RegisterAuthorizatorScreenState
    extends State<RegisterAuthorizatorScreen> {
  final String headerScreen = "Tạo tài khoản mới";

  final double marginComponent = 20;

  final Color iconColor = AppColorsLight.primary;

  TextEditingController textControllerEmail = TextEditingController();

  TextEditingController textControllerPassword = TextEditingController();

  TextEditingController textControllerFullname = TextEditingController();

  TextEditingController textControllerGenter = TextEditingController();

  TextEditingController textControllerUsername = TextEditingController();

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
                  controller: textControllerFullname,
                  hintText: "Tên đầy đủ",
                ),
                SpacingVerticalWidget(height: marginComponent),
                SelectGenderWidget(controller: textControllerGenter),
                SpacingVerticalWidget(height: marginComponent),
                InputWidget(
                  icon: SvgGenSizeWidget(
                      icon: Assets.icons.heart.svg(color: iconColor)),
                  controller: textControllerEmail,
                  hintText: "Địa chỉ email",
                ),
                SpacingVerticalWidget(height: marginComponent),
                InputWidget(
                  icon: SvgGenSizeWidget(
                      icon: Assets.icons.heart.svg(color: iconColor)),
                  controller: textControllerUsername,
                  hintText: "Tài khoản",
                ),
                SpacingVerticalWidget(height: marginComponent),
                InputWidget(
                    icon: SvgGenSizeWidget(
                        icon: Assets.icons.heart.svg(color: iconColor)),
                    controller: textControllerPassword,
                    hintText: "Mật khẩu",
                    isPasswordTextField: true),
                const Expanded(child: SizedBox()),
                CustomizeButtonWidget(
                  onPressed: () {},
                  title: "Đăng ký",
                  isEnable: true,
                ),
                const SpacingVerticalWidget(height: 20),
                const LoginTextWidget()
              ],
            ),
          ),
        ));
  }
}
