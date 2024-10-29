import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/theme/app_colors.dart';
import 'package:foodioo/Core/theme/app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorsLight.primary,
      scaffoldBackgroundColor:
          AppColorsLight.background, // ddoori laji khi xong
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorsLight.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstant.radiusExtra),
              topRight: Radius.circular(AppConstant.radiusExtra)),
        ),
        backgroundColor: AppColorsLight.background,
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColorsLight.textContent),
      // inputDecorationTheme: InputDecorationTheme(
      //     filled: true,
      //     hintStyle: AppTypographyLight.disableTextFieldDarkMode,
      //     contentPadding: const EdgeInsets.symmetric(
      //         vertical: AppConfigConstant.paddingVerticalTextField,
      //         horizontal: AppConfigConstant.paddingHorizontalTextField),
      //     labelStyle: AppTypography.disableTextFieldDarkMode,
      //     floatingLabelBehavior: FloatingLabelBehavior.never,
      //     fillColor: AppColors.textFieldColorDarkMode,
      //     border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(
      //             AppConfigConstant.radiusButtonMediumSize),
      //         borderSide: BorderSide.none)),
      textTheme: AppTypographyLight.textTheme,
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: const WidgetStatePropertyAll<TextStyle>(
      //         AppTypography.textContainerBoldDarkMode),
      //     backgroundColor: WidgetStateProperty.all<Color>(
      //         AppColors.containerMissedMediumColorBox),
      //     foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
      //     shape: WidgetStatePropertyAll<OutlinedBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(
      //             AppConfigConstant.radiusButtonSmallSize),
      //       ),
      //     ),
      //     padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
      //         EdgeInsets.symmetric(
      //             vertical: AppConfigConstant.paddingVerticalButtonMin)),
      //   ),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: const WidgetStatePropertyAll<TextStyle>(
      //         AppTypography.textButtonExtraBold),
      //     backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
      //     foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
      //     shape: WidgetStatePropertyAll<OutlinedBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(
      //             AppConfigConstant.radiusButtonBigSize),
      //       ),
      //     ),
      //     padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
      //         EdgeInsets.symmetric(
      //             vertical: AppConfigConstant.paddingVerticalButton)),
      //   ),
      // )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorsDark.primary,
      scaffoldBackgroundColor: AppColorsDark.background, // ddoori laji khi xong
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorsDark.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstant.radiusExtra),
              topRight: Radius.circular(AppConstant.radiusExtra)),
        ),
        backgroundColor: AppColorsDark.background,
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColorsDark.textContent),
      // inputDecorationTheme: InputDecorationTheme(
      //     filled: true,
      //     hintStyle: AppTypographyLight.disableTextFieldDarkMode,
      //     contentPadding: const EdgeInsets.symmetric(
      //         vertical: AppConfigConstant.paddingVerticalTextField,
      //         horizontal: AppConfigConstant.paddingHorizontalTextField),
      //     labelStyle: AppTypography.disableTextFieldDarkMode,
      //     floatingLabelBehavior: FloatingLabelBehavior.never,
      //     fillColor: AppColors.textFieldColorDarkMode,
      //     border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(
      //             AppConfigConstant.radiusButtonMediumSize),
      //         borderSide: BorderSide.none)),
      textTheme: AppTypographyDark.textTheme,
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: const WidgetStatePropertyAll<TextStyle>(
      //         AppTypography.textContainerBoldDarkMode),
      //     backgroundColor: WidgetStateProperty.all<Color>(
      //         AppColors.containerMissedMediumColorBox),
      //     foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
      //     shape: WidgetStatePropertyAll<OutlinedBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(
      //             AppConfigConstant.radiusButtonSmallSize),
      //       ),
      //     ),
      //     padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
      //         EdgeInsets.symmetric(
      //             vertical: AppConfigConstant.paddingVerticalButtonMin)),
      //   ),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: const WidgetStatePropertyAll<TextStyle>(
      //         AppTypography.textButtonExtraBold),
      //     backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
      //     foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
      //     shape: WidgetStatePropertyAll<OutlinedBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(
      //             AppConfigConstant.radiusButtonBigSize),
      //       ),
      //     ),
      //     padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
      //         EdgeInsets.symmetric(
      //             vertical: AppConfigConstant.paddingVerticalButton)),
      //   ),
      // )
    );
  }
}
