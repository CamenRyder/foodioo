// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';

import 'package:foodioo/core/theme/app_colors.dart';

import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/assets.gen.dart';

class BottomNavBarWidget extends StatefulWidget {
  final PageController pageController;
  const BottomNavBarWidget({super.key, required this.pageController});
  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarWidget> {
  int index = 0;
  double heightIcon = 24;
  double widthIcon = 28;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      decoration: const BoxDecoration(
          // color: Colors.red,
          border: Border(
              top: BorderSide(color: AppColorsLight.textHint, width: 0.5))),
      child: BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).hintColor,
          elevation: 1,
          selectedLabelStyle: AppTypographyLight.textHintBold,
          unselectedLabelStyle: AppTypographyLight.textHintBold,
          selectedFontSize: AppConstant.textSizeButton,
          unselectedFontSize: AppConstant.textSizeButton,
          items: [
            BottomNavigationBarItem(
                // icon: Icon(Icons.home, size: 28),
                icon: Assets.icons.home.svg(
                  width: widthIcon,
                  height: heightIcon,
                  color: Theme.of(context).hintColor,
                ),
                activeIcon: Assets.icons.home.svg(
                    width: widthIcon,
                    height: heightIcon,
                    color: AppColorsLight.primary),
                label: 'Trang chủ'),
            BottomNavigationBarItem(
                // icon: Icon(Icons.home, size: 28),
                icon: Assets.icons.bag.svg(
                  width: widthIcon,
                  height: heightIcon,
                  color: Theme.of(context).hintColor,
                ),
                activeIcon: Assets.icons.bag.svg(
                    width: widthIcon,
                    height: heightIcon,
                    color: AppColorsLight.primary),
                label: 'Quán'),
            BottomNavigationBarItem(
                // icon: Icon(Icons.home, size: 28),
                icon: Assets.icons.search.svg(
                  width: widthIcon,
                  height: heightIcon,
                  color: Theme.of(context).hintColor,
                ),
                activeIcon: Assets.icons.search.svg(
                    width: widthIcon,
                    height: heightIcon,
                    color: AppColorsLight.primary),
                label: 'Tìm kiếm'),
            BottomNavigationBarItem(
                // icon: Icon(Icons.home, size: 28),
                icon: Assets.icons.notification.svg(
                  width: widthIcon,
                  height: heightIcon,
                  color: Theme.of(context).hintColor,
                ),
                activeIcon: Assets.icons.notification.svg(
                    width: widthIcon,
                    height: heightIcon,
                    color: AppColorsLight.primary),
                label: 'Thông báo'),
            BottomNavigationBarItem(
                // icon: Icon(Icons.home, size: 28),
                icon: Assets.icons.profile.svg(
                  width: widthIcon,
                  height: heightIcon,
                  color: Theme.of(context).hintColor,
                ),
                activeIcon: Assets.icons.profile.svg(
                    width: widthIcon,
                    height: heightIcon,
                    color: AppColorsLight.primary),
                label: 'Cá nhân'),
          ],
          onTap: (int index) async {
            setState(() {
              this.index = index;
              widget.pageController.jumpToPage(index);
            });
          }),
    );
  }
}
