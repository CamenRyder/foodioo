import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SystemState {
  final ScrollController scrollController;
  final PageController pageController;
  final Position? currentPosition;
  final bool isShowBottomNavBar;
  final bool isShowAppBar;

  SystemState({
    required this.scrollController,
    required this.pageController,
    this.currentPosition,
    this.isShowAppBar = true,
    this.isShowBottomNavBar = true,
  });

  SystemState copyWith({
    ScrollController? scrollController,
    PageController? pageController,
    Position? currentPosition,
    bool? isShowBottomNavBar,
    bool? isShowAppBar,
  }) {
    return SystemState(
      isShowBottomNavBar: isShowBottomNavBar ?? this.isShowBottomNavBar,
      isShowAppBar: isShowAppBar ?? this.isShowAppBar,
      currentPosition: currentPosition ?? this.currentPosition,
      scrollController: scrollController ?? this.scrollController,
      pageController: pageController ?? this.pageController,
    );
  }
}
