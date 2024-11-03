import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';

class LoginTextWidget extends StatelessWidget {
  final String suffixText = "Bạn đã có tài khoản? ";
  final String prefixText = "Đăng nhập";

  const LoginTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(text: suffixText, style: AppTypographyLight.textHintBold),
        TextSpan(
            text: prefixText, style: AppTypographyLight.textContentPrimaryBold),
      ],
    ));
  }
}
