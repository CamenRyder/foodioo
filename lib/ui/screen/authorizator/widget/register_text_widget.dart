import 'package:flutter/material.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/theme/app_typography.dart';

class RegisterTextWidget extends StatelessWidget {
  final String suffixText = "Bạn chưa có tài khoản? ";
  final String prefixText = "Đăng ký";
  final VoidCallback onTap;
  const RegisterTextWidget({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
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
