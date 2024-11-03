import 'package:flutter/material.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/theme/app_typography.dart';

class RegisterTextWidget extends StatelessWidget {
  final String suffixText = "Bạn chưa có tài khoản? ";
  final String prefixText = "Đăng ký";

  const RegisterTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, NavigatorNames.REGISTER),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(text: suffixText, style: AppTypographyLight.textHintBold),
          TextSpan(
              text: prefixText,
              style: AppTypographyLight.textContentPrimaryBold),
        ],
      )),
    );
  }
}
