import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../General/image_customize_widget.dart';
import 'button_show_map_widget.dart';
import 'intereactive_post_widget.dart';
import 'user_infor_post_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final double heightImageDefault = 300;

  final double paddingTextWithScreen = 9;

  final double dotSize = 8.5;

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthScreen,
      child: Column(
        children: [
          const UserInforPostWidget(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: paddingTextWithScreen),
              width: widthScreen,
              child: Text(
                "Quán mình luôn sẵn cơm miễn phí gọi khi ăn kèm với phở nha! \nPhở bên mình ngon thì là cái ghế tại nó ko phải bàn haha ha",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          Container(
              height: heightImageDefault,
              width: widthScreen,
              color: AppColors.grey50,
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return CustomImageForLangscope(
                        fit: BoxFit.cover,
                        url:
                            'https://img-global.cpcdn.com/recipes/cab5d5aa25abd81a/1200x630cq70/photo.jpg',
                        height: heightImageDefault,
                        width: widthScreen,
                      );
                    },
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: ButtonShowMapWidget(),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: AppConstant.paddingIndicator),
                        padding:
                            const EdgeInsets.all(AppConstant.paddingIndicator),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.circular(AppConstant.radiusSmall)),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 4,
                          effect: WormEffect(
                              dotHeight: dotSize,
                              dotWidth: dotSize,
                              spacing: AppConstant.paddingIcon,
                              dotColor: AppColorsLight.textHint,
                              activeDotColor: AppColorsLight.primary),
                        ),
                      )),
                ],
              )),
          _dividerCustomeize(widthScreen, context, 1),
          const IntereactivePostWidget(),
          _dividerCustomeize(widthScreen, context, paddingTextWithScreen - 6),
        ],
      ),
    );
  }

  Widget _dividerCustomeize(
      double widthScreen, BuildContext context, double heightDivider) {
    return Container(
      color: AppColors.grey50,
      height: heightDivider,
      width: widthScreen,
    );
  }
}
