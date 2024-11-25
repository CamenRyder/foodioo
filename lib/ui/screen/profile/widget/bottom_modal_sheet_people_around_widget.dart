import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodioo/Core/constants/constant_stataue.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../General/image_customize_widget.dart';

class BottomModalSheetPeopleAroundWidget extends StatefulWidget {
  const BottomModalSheetPeopleAroundWidget({super.key});

  @override
  State<BottomModalSheetPeopleAroundWidget> createState() =>
      _BottomModalSheetPeopleAroundWidgetState();
}

class _BottomModalSheetPeopleAroundWidgetState
    extends State<BottomModalSheetPeopleAroundWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<String> listTitle = [
    "Bạn bè",
    "Phê duyệt",
    "Đang chờ",
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: listTitle.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double widthTabbar = MediaQuery.sizeOf(context).width / 3 - 60;
    final heighScreen = MediaQuery.sizeOf(context).height;
    final sizeAvatar = widthTabbar / 1.5 + 12;
    String urlImageTemp =
        'https://i.pinimg.com/550x/38/d0/e7/38d0e70f02cbef89d1968e3770977a6b.jpg';
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstant.paddingVerticalApp,
          horizontal: AppConstant.paddingHorizontalApp),
      height: heighScreen * 0.8,
      width: double.infinity,
      child: Column(
        children: [
          const SpacingVerticalWidget(
            height: 20,
          ),
          TabBar(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              isScrollable: false,
              dividerHeight: 4,
              onTap: (value) {},
              dividerColor: AppColors.grey50,
              dragStartBehavior: DragStartBehavior.down,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 4,
              tabAlignment: TabAlignment.center,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.only(
                  top: 9.5,
                  bottom: 13.5,
                  left: AppConstant.paddingHorizontalApp,
                  right: AppConstant.paddingHorizontalApp),
              labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelStyle: const TextStyle(
                  color: AppColors.grey50,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
              tabs: listTitle.map((e) {
                return Container(
                    width: widthTabbar,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                      ),
                    ));
              }).toList()),
          Expanded(
              child: ListView(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: AppConstant.paddingContent,
                    vertical: AppConstant.paddingComponent),
                decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusLarge)),
                padding: const EdgeInsets.symmetric(
                    vertical: AppConstant.paddingContent + 2,
                    horizontal: AppConstant.paddingHorizontalApp),
                child: Row(children: [
                  CustomImage(
                    radius: 120,
                    url: urlImageTemp,
                    size: sizeAvatar,
                  ),
                  const SpacingHorizontalWidget(
                    width: AppConstant.paddingButton,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nagato",
                        style: TextStyle(
                          color: AppColorsLight.textContent,
                          fontSize: AppConstant.textSizeButton,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Hủy bỏ",
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
                ]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: AppConstant.paddingContent,
                    vertical: AppConstant.paddingComponent),
                decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusLarge)),
                padding: const EdgeInsets.symmetric(
                    vertical: AppConstant.paddingContent + 2,
                    horizontal: AppConstant.paddingHorizontalApp),
                child: Row(children: [
                  CustomImage(
                    radius: 120,
                    url: urlImageTemp,
                    size: sizeAvatar,
                  ),
                  const SpacingHorizontalWidget(
                    width: AppConstant.paddingButton,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nagato",
                        style: TextStyle(
                          color: AppColorsLight.textContent,
                          fontSize: AppConstant.textSizeButton,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Chấp thuận",
                            style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Từ chối",
                            style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ))
                ]),
              )
            ],
          ))
        ],
      ),
    );
  }
}
