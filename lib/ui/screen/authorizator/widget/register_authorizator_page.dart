import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodioo/core/theme/assets.gen.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';

import '../../../../core/constants/constant_stataue.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/authentication/auth_event.dart';
import '../../../../repositories/view/register_vm.dart';
import '../../../general/customize_button_widget.dart';
import '../../../general/spacing_vertical_widget.dart';
import '../../../general/svg_gen_size_widget.dart';
import 'input_widget.dart';
import 'login_text_widget.dart';
import 'select_gender_widget.dart';

class RegisterAuthorizatorScreen extends StatefulWidget {
  const RegisterAuthorizatorScreen({super.key, required this.pageController});
  final PageController pageController;

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
                  onPressed: () => handleOnPressRegisterButton(context),
                  title: "Đăng ký",
                  isEnable: true,
                ),
                const SpacingVerticalWidget(height: 20),
                LoginTextWidget(onTap: () => handleOnPressMoveLoginPage())
              ],
            ),
          ),
        ));
  }

  handleOnPressMoveLoginPage() {
    setState(() {
      widget.pageController.animateToPage(0,
          duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
    });
  }

  handleOnPressRegisterButton(BuildContext context) {
    if (textControllerEmail.text.isEmpty) {
      MessageToast.showToast(context, "Vui lòng nhập Email của bạn");
    } else if (textControllerFullname.text.isEmpty) {
      MessageToast.showToast(context, "Vui lòng nhập tên của bạn");
    } else if (textControllerGenter.text.isEmpty) {
      MessageToast.showToast(context, "Hãy chọn giới tính của bạn");
    } else if (textControllerPassword.text.isEmpty) {
      MessageToast.showToast(context, "Hãy nhập mật khẩu của bạn");
    } else if (textControllerUsername.text.isEmpty) {
      MessageToast.showToast(context, "Hãy nhập tài khoản của bạn");
    } else {
      final userRegister = RegisterViewModel(
          email: textControllerEmail.text,
          fullname: textControllerFullname.text,
          gender: textControllerGenter.text == "Nam" ? 1 : 0,
          username: textControllerUsername.text,
          password: textControllerPassword.text);

      context.read<AuthBloc>().add(RegisterUser(user: userRegister));
    }
  }
}
