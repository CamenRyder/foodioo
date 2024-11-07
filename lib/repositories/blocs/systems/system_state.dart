import 'package:flutter/material.dart';

class SystemState {
  final ScrollController scrollController;
  final PageController pageController;
  final bool isShowBottomNavBar;
  final bool isShowAppBar;  

  SystemState({
    required this.scrollController,
    required this.pageController,
    this.isShowAppBar = true ,  
    this.isShowBottomNavBar = true ,  
  });

  SystemState copyWith({
    ScrollController? scrollController,
    PageController? pageController,
    bool? isShowBottomNavBar,
    bool? isShowAppBar,
  }) {
    return SystemState(
      isShowBottomNavBar: isShowBottomNavBar ?? this.isShowBottomNavBar,  
      isShowAppBar: isShowAppBar ?? this.isShowAppBar,
      scrollController: scrollController ?? this.scrollController,
      pageController: pageController ?? this.pageController,
    );
  }
}
