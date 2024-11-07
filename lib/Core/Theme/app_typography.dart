import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/theme/app_colors.dart';

class AppTypography {
  static const textButtonExtraBold =
      TextStyle(fontSize: AppConstant.textSizeButton);
}

class AppTypographyLight {
  static const textContentPrimaryBold = TextStyle(
    color: AppColorsLight.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w800,
  );
  static const textContentPrimary = TextStyle(
    color: AppColorsLight.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w500,
  );

  static const textHeader = TextStyle(
    color: AppColorsLight.textContent,
    fontSize: AppConstant.textSizeHeader,
    fontWeight: FontWeight.w800,
  );

  static const textHeaderPrimay = TextStyle(
    color: AppColorsLight.primary,
    fontSize: AppConstant.textSizeHeader,
    fontWeight: FontWeight.w800,
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

  static const textButtonBold = TextStyle(
    color: AppColors.white,
    fontSize: AppConstant.textSizeButton,
    fontWeight: FontWeight.w800,
  );

  static const textHintBold = TextStyle(
    color: AppColorsLight.textHint,
    fontSize: AppConstant.textSizeHint,
    fontWeight: FontWeight.w800,
  );

  static TextTheme get textTheme => const TextTheme(
        headlineMedium: textHeader,
        headlineLarge: textHeaderPrimay,
        bodyLarge: textContentBold,
        bodyMedium: textContentPrimary,
        bodySmall: textContent,
        titleMedium: textContentPrimaryBold,
        titleSmall: textHintBold,
      );
}

class AppTypographyDark {
  static const textContentPrimaryBold = TextStyle(
    color: AppColorsDark.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w800,
  );
  static const textContentPrimary = TextStyle(
    color: AppColorsDark.primary,
    fontSize: AppConstant.textSizeContent,
    fontWeight: FontWeight.w500,
  );

  static const textButtonBold = TextStyle(
    color: AppColors.white,
    fontSize: AppConstant.textSizeButton,
    fontWeight: FontWeight.w800,
  );

  static const textHeader = TextStyle(
    color: AppColorsDark.textContent,
    fontSize: AppConstant.textSizeHeader,
    fontWeight: FontWeight.w800,
  );

  static const textHeaderPrimay = TextStyle(
    color: AppColorsDark.primary,
    fontSize: AppConstant.textSizeHeader,
    fontWeight: FontWeight.w800,
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
    color: AppColorsDark.textHint,
    fontSize: AppConstant.textSizeHint,
    fontWeight: FontWeight.w800,
  );
  // static TextTheme get textTheme => TextThemeCustomer(
  //     textHintBold: textHintBold,
  //     textContent: textContent,
  //     textContentPrimaryBold: textContentPrimaryBold,
  //     textContentPrimary: textContentPrimary,
  //     textContentBold: textContentBold,
  //     textHeader: textHeader);

  static TextTheme get textTheme => const TextTheme(
        headlineMedium: textHeader,
        headlineLarge: textHeaderPrimay,
        bodyLarge: textContentBold,
        bodyMedium: textContentPrimary,
        bodySmall: textContent,
        titleMedium: textContentPrimaryBold,
        titleSmall: textHintBold,
      );
}

class TextThemeCustomer extends TextTheme {
  TextStyle textHintBold;
  TextStyle textContent;
  TextStyle textContentPrimaryBold;
  TextStyle textContentPrimary;
  TextStyle textContentBold;
  TextStyle textHeader;
  TextThemeCustomer(
      {required this.textHintBold,
      required this.textContent,
      required this.textContentPrimaryBold,
      required this.textContentPrimary,
      required this.textContentBold,
      required this.textHeader})
      : super();
}
