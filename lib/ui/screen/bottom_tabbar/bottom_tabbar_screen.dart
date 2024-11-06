import 'package:flutter/material.dart';
import 'package:foodioo/ui/screen/home%20/home_screen.dart';
import 'package:foodioo/ui/screen/notification/not%C3%ACication_screen.dart';
import 'package:foodioo/ui/screen/profile/profile_screen.dart';
import 'package:foodioo/ui/screen/search/search_screen.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

import '../food_store/store_screen.dart';
import 'widget/bottom_navbar_widget.dart';

class BottomTabbarScreen extends StatefulWidget {
  const BottomTabbarScreen({super.key});

  @override
  State<BottomTabbarScreen> createState() => _BottomTabbarScreenState();
}

class _BottomTabbarScreenState extends State<BottomTabbarScreen> {
  final PageController pageController = PageController();
  final PageController scrollControllerHome = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(
            scrollController: scrollControllerHome,
          ),
          StoreScreen(),
          SearchScreen(),
          NotificationScreen(),
          const ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        pageController: pageController,
      ),
    );
  }
}
