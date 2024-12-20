import 'package:flutter/material.dart';

import '../constants/constant_stataue.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColorsLight.primary,
        hintColor: AppColorsLight.textContent,
        splashColor: AppColorsLight.background,
        cardColor: AppColors.spaceGrey,
        canvasColor: AppColorsLight.primary,
        highlightColor: AppColors.spaceGrey,
        unselectedWidgetColor: AppColors.componentNotification,
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
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColorsLight.textContent),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstant.radiusLarge),
              borderSide: const BorderSide(color: AppColorsDark.textHint),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstant.radiusLarge),
              borderSide: const BorderSide(color: AppColorsDark.textHint),
            ),
            hintStyle: AppTypographyLight.textHintBold,
            contentPadding: const EdgeInsets.symmetric(
                vertical: AppConstant.paddingContent),
            labelStyle: AppTypographyLight.textHintBold,
            floatingLabelStyle: AppTypographyLight.textHintBold,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            activeIndicatorBorder:
                const BorderSide(color: AppColorsLight.primary)),
        textTheme: AppTypographyLight.textTheme,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColorsLight.primary),
            foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
            textStyle: const WidgetStatePropertyAll<TextStyle>(
                AppTypographyLight.textButtonBold),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstant.radiusExtra),
              ),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: AppConstant.paddingButton)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: const WidgetStatePropertyAll<TextStyle>(
                AppTypography.textButtonExtraBold),
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColorsLight.primary),
            foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstant.radiusExtra),
              ),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: AppConstant.paddingButton)),
          ),
        ));
  }

  static List<BoxShadow> shadowLight = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.8),
      blurRadius: 9,
      offset: const Offset(0, 3),
    )
  ];
  static List<BoxShadow> shadowDark = [
    BoxShadow(
      color: const Color.fromARGB(255, 37, 33, 33).withOpacity(0.8),
      blurRadius: 9,
      offset: const Offset(0, 3),
    )
  ];

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColorsDark.primary,
        splashColor: AppColorsDark.background,
        hintColor: AppColorsDark.textContent,
        cardColor: const Color.fromARGB(255, 196, 23, 34),
        canvasColor: AppColorsDark.textContent,
        unselectedWidgetColor: const Color.fromARGB(255, 80, 74, 74),
        highlightColor: AppColors.grey50,
        scaffoldBackgroundColor:
            AppColorsDark.background, // ddoori laji khi xong
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
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColorsDark.textContent),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstant.radiusLarge),
              borderSide: const BorderSide(color: AppColorsDark.textHint),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstant.radiusLarge),
              borderSide: const BorderSide(color: AppColorsDark.textHint),
            ),
            hintStyle: AppTypographyLight.textHintBold,
            contentPadding: const EdgeInsets.symmetric(
                vertical: AppConstant.paddingContent),
            labelStyle: AppTypographyLight.textHintBold,
            floatingLabelStyle: AppTypographyLight.textHintBold,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            activeIndicatorBorder:
                const BorderSide(color: AppColorsLight.primary)),
        textTheme: AppTypographyDark.textTheme,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColorsDark.primary),
            foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
            textStyle: const WidgetStatePropertyAll<TextStyle>(
                AppTypographyDark.textButtonBold),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstant.radiusExtra),
              ),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: AppConstant.paddingButton)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: const WidgetStatePropertyAll<TextStyle>(
                AppTypography.textButtonExtraBold),
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColorsDark.primary),
            foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstant.radiusExtra),
              ),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: AppConstant.paddingButton)),
          ),
        ));
  }
}
