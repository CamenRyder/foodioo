import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/systems/system_bloc.dart';
import 'package:foodioo/ui/screen/home%20/home_screen.dart';
import 'package:foodioo/ui/screen/notification/notification_screen.dart';
import 'package:foodioo/ui/screen/profile/profile_screen.dart';
import 'package:foodioo/ui/screen/search/search_screen.dart';

import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/blocs/systems/system_state.dart';
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
    int currnetAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          StoreScreen(),
          SearchScreen(),
          const NotificationScreen(),
          ProfileScreen(viaAccountId: currnetAccountId)
        ],
      ),
      bottomNavigationBar: BlocBuilder<SystemBloc, SystemState>(
        buildWhen: (previous, current) {
          return current.scrollController != previous.scrollController;
        },
        builder: (context, state) =>
            BottomNavBarWidget(pageController: pageController),
      ),
    );
  }
}

/*

 AnimatedContainer(
            duration: const Duration(
                milliseconds: AppConstant.durationAnimationSystemGeneral),
            height: !state.isShowBottomNavBar ? 0 : 100,
            curve: Curves.fastEaseInToSlowEaseOut,
            child: BottomNavBarWidget(
              pageController: pageController,
            ),
          ),

*/