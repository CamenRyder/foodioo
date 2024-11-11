import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../repositories/models/post_model.dart';
import '../../../General/image_customize_widget.dart';
import 'button_show_map_widget.dart';
import 'intereactive_post_widget.dart';
import 'user_infor_post_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.postModel});

  final PostModel postModel;

  @override
  State<PostWidget> createState() => _PostWidgetState();

  static Widget loading(BuildContext context) => SizedBox(
        width: 300,
        child: Column(
          children: [
            UserInforPostWidget(),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: 300,
                child: Text(
                  " ",
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Container(
                height: 300,
                width: 300,
                color: AppColors.grey50,
                child: Stack(
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const CustomImageForLangscope(
                          fit: BoxFit.cover,
                          url:
                              'https://img-global.cpcdn.com/recipes/cab5d5aa25abd81a/1200x630cq70/photo.jpg',
                          height: 300,
                          width: 300,
                        );
                      },
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: ButtonShowMapWidget(),
                    ),
                  ],
                )),
            IntereactivePostWidget(
              postModel: PostModel(),
            ),
          ],
        ),
      );
}

class _PostWidgetState extends State<PostWidget> {
  final double heightImageDefault = 300;

  final double paddingTextWithScreen = 9;
  final String url = AppConstant.baseURL;
  final double dotSize = 8.5;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthScreen,
      child: Column(
        children: [
          UserInforPostWidget(postModel: widget.postModel),
          Container(
              padding: EdgeInsets.symmetric(horizontal: paddingTextWithScreen),
              width: widthScreen,
              child: Text(
                widget.postModel.description ?? " ",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          widget.postModel.images!.isEmpty
              ? const SizedBox()
              : Container(
                  height: heightImageDefault,
                  width: widthScreen,
                  color: AppColors.grey50,
                  child: Stack(
                    children: [
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        itemCount: widget.postModel.images!.length,
                        itemBuilder: (context, index) {
                          String subMainUrl =
                              widget.postModel.images![index].urlImage ?? '';
                          String urlImage = url + subMainUrl;
                          return CustomImageForLangscope(
                            fit: BoxFit.cover,
                            url: urlImage,
                            height: heightImageDefault,
                            width: widthScreen,
                          );
                        },
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: ButtonShowMapWidget(),
                      ),
                      widget.postModel.images!.isEmpty ||
                              widget.postModel.images!.length == 1
                          ? const SizedBox()
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: AppConstant.paddingIndicator),
                                padding: const EdgeInsets.all(
                                    AppConstant.paddingIndicator),
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(
                                        AppConstant.radiusSmall)),
                                child: SmoothPageIndicator(
                                  controller: pageController,
                                  count: widget.postModel.images!.length,
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
          IntereactivePostWidget(
            postModel: widget.postModel,
          ),
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
