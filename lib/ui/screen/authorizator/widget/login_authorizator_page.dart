import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/core/theme/app_colors.dart';
import 'package:foodioo/core/theme/app_typography.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';

import '../../../../core/constants/constant_stataue.dart';
import '../../../../core/theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/authentication/auth_event.dart';
import '../../../../repositories/view/login_vm.dart';
import '../../../General/message_over_screen.dart';
import '../../../general/customize_button_widget.dart';
import '../../../general/svg_gen_size_widget.dart';
import 'input_widget.dart';
import 'register_text_widget.dart';

class LoginAuthorizatorPage extends StatefulWidget {
  const LoginAuthorizatorPage(
      {super.key, this.isBack = false, required this.pageController});
  final bool isBack;
  final PageController pageController;

  @override
  State<LoginAuthorizatorPage> createState() => _LoginAuthorizatorScreenState();
}

class _LoginAuthorizatorScreenState extends State<LoginAuthorizatorPage> {
  final double marginComponent = 20;
  TextEditingController textLogin = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String headerScreen =
        widget.isBack ? "Chào mừng trở lại" : "Đăng nhập";
    return Scaffold(
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
                style: (Theme.of(context).textTheme).headlineMedium,
              ),
            ),
            SpacingVerticalWidget(height: marginComponent),
            InputWidget(
              icon: SvgGenSizeWidget(
                  icon: Assets.icons.mail
                      .svg(color: Theme.of(context).primaryColor)),
              controller: textLogin,
              hintText: "Tài khoản",
              isPasswordTextField: false,
            ),
            SpacingVerticalWidget(height: marginComponent),
            InputWidget(
                icon: SvgGenSizeWidget(
                    icon: Assets.icons.key
                        .svg(color: Theme.of(context).primaryColor)),
                controller: textPassword,
                hintText: "Mật khẩu",
                isPasswordTextField: true),
            const SpacingVerticalWidget(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: () => handleOnPressForgotPasswordButton(context),
                    child: const Text(
                      "Quên mật khẩu",
                      style: AppTypographyLight.textContentPrimaryBold,
                    ),
                  )),
            ),
            const Expanded(child: SizedBox()),
            CustomizeButtonWidget(
              onPressed: () => handleOnPressLoginButton(context),
              title: "Đăng nhập",
              isEnable: true,
            ),
            const SpacingVerticalWidget(height: 20),
            RegisterTextWidget(onTap: () => handleOnPressMoveRegisterScreen())
          ],
        ),
      ),
    ));
  }

  handleOnPressMoveRegisterScreen() {
    setState(() {
      widget.pageController.animateToPage(1,
          duration: const Duration(milliseconds: 150), curve: Curves.ease);
    });
  }

  handleOnPressForgotPasswordButton(BuildContext context) {
    MessageToast.showToast(context, "Tính năng đang bảo trì!");
  }

  handleOnPressLoginButton(BuildContext context) {
    if (textLogin.text.isEmpty) {
      MessageToast.showToast(context, "Vui lòng nhập tài khoản!");
    } else if (textPassword.text.isEmpty) {
      MessageToast.showToast(context, "Vui lòng nhập mật khẩu!");
    } else {
      LoginViewModel data =
          LoginViewModel(password: textPassword.text, username: textLogin.text);
      context.read<AuthBloc>().add(LoginUser(user: data));
    }
  }
}
