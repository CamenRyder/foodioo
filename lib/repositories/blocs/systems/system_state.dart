import 'package:flutter/material.dart';

class SystemState {
  final ScrollController scrollController;
  final PageController pageController;

  SystemState({
    required this.scrollController ,
     required this.pageController , 
  });

  SystemState copyWith({
    ScrollController? scrollController,
    PageController? pageController,
  }) {
    return SystemState(
      scrollController: scrollController ?? this.scrollController,
      pageController: pageController ?? this.pageController,
    );
  }
}
