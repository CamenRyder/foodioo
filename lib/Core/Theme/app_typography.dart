import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/theme/app_colors.dart';

class AppTypography {
  static const textButtonExtraBold =
      TextStyle(fontSize: AppConstant.textSizeButton);
}

class AppTypographyLight {
  static const textPrimaryBold = TextStyle(
    color: AppColorsLight.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w800,
  );
  static const textPrimary = TextStyle(
    color: AppColorsLight.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w500,
  );

  static const textContentBold = TextStyle(
    color: AppColorsLight.textContent,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w800,
  );
  static const textContent = TextStyle(
    color: AppColorsLight.textContent,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w500,
  );

  static const textHintBold = TextStyle(
    color: AppColorsLight.textContent,
    fontSize: AppConstant.textSizeHint,
    fontWeight: FontWeight.w800,
  );
  
  static TextTheme get textTheme => const TextTheme(
      bodyMedium: textContent,
      bodyLarge: textContentBold,
      bodySmall: textPrimaryBold);
}

class AppTypographyDark {
  static const textPrimaryBold = TextStyle(
    color: AppColorsDark.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w800,
  );
  static const textPrimary = TextStyle(
    color: AppColorsDark.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w500,
  );

  static const textContentBold = TextStyle(
    color: AppColorsDark.textContent,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w800,
  );
  static const textContent = TextStyle(
    color: AppColorsDark.textContent,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w500,
  );

  static const textHintBold = TextStyle(
    color: AppColorsLight.textContent,
    fontSize: AppConstant.textSizeHint,
    fontWeight: FontWeight.w800,
  );

  static TextTheme get textTheme => const TextTheme(
      bodyMedium: textContent,
      bodyLarge: textContentBold,
      bodySmall: textPrimaryBold);
}
