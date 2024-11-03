import 'package:flutter/material.dart';
import 'package:foodioo/core/routes/routes_name.dart';
import 'package:foodioo/ui/general/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/constant_stataue.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/assets.gen.dart';
import '../../general/circle_point_marker_widget.dart';
import 'widget/intro_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController pageController = PageController();
  double dotSize = 12;
  @override
  Widget build(BuildContext context) {
    double sizeImage = MediaQuery.sizeOf(context).width;
    const radiusContainer = Radius.circular(AppConstant.radiusExtra);
    const textNormalStyle = TextStyle(
        color: AppColorsLight.textHint,
        fontSize: AppConstant.textSizeContent,
        fontWeight: FontWeight.w800,
        wordSpacing: 1.3);
    const textTitleStyle = TextStyle(
        color: AppColorsLight.textContent,
        fontSize: AppConstant.textSizeHeader,
        fontWeight: FontWeight.w800,
        wordSpacing: 1.3);
    return Scaffold(
        body: Stack(children: [
      PageView(
        // physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          IntroWidget(
            image: Assets.images.intro01
                .image(height: sizeImage, width: sizeImage),
          ),
          IntroWidget(
            image: Assets.images.intro02
                .image(height: sizeImage, width: sizeImage),
          ),
          IntroWidget(
            image: Assets.images.intro03
                .image(height: sizeImage, width: sizeImage),
          ),
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(
              vertical: AppConstant.paddingVerticalApp,
              horizontal: AppConstant.paddingHorizontalApp),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 67, 64, 64).withOpacity(0.8),
                  blurRadius: 12,
                  offset: const Offset(-1, 1),
                )
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: radiusContainer, topRight: radiusContainer)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Quán xung quanh đây",
                style: textTitleStyle,
              ),
              const SpacingVerticalWidget(
                height: 20,
              ),
              RichText(
                  textScaleFactor: 1.2,
                  text: const TextSpan(
                      text: "Tụ tập từ quán best choice từ đánh giá của",
                      children: [
                        TextSpan(
                            text: " cộng đồng Foodioo.",
                            style: AppTypographyLight.textContentPrimaryBold),
                        TextSpan(
                            text: " Khám phá xung quanh khu vực của mình bằng",
                            style: textNormalStyle),
                        TextSpan(
                            text: " tìm kiếm ",
                            style: AppTypographyLight.textContentPrimaryBold),
                        TextSpan(text: "thông minh.", style: textNormalStyle),
                      ],
                      style: textNormalStyle)),
              const SpacingVerticalWidget(),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        dotHeight: dotSize,
                        dotWidth: dotSize,
                        dotColor: AppColorsLight.textHint,
                        activeDotColor: AppColorsLight.primary),
                  ),
                  const SpacingHorizontalWidget(),
                  IconButton(
                      iconSize: 35,
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColorsLight.primary)),
                      onPressed: () {
                        setState(() {
                          if (pageController.page == 2) {
                            Navigator.pushReplacementNamed(
                                context, NavigatorNames.APP_MAIN);
                          }
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.white,
                      )),
                  const SpacingHorizontalWidget(
                    width: 12,
                  ),
                ],
              ),
              const SpacingVerticalWidget(height: 12),
            ],
          ),
        ),
      )
    ]));
  }
}
