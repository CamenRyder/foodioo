import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodioo/ui/screen/home%20/home_screen.dart';

class BottomTabbarScreen extends StatefulWidget {
  @override
  State<BottomTabbarScreen> createState() => _BottomTabbarScreenState();
}

class _BottomTabbarScreenState extends State<BottomTabbarScreen> {

   final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [ 
          HomeScreen(), 
          
        ],

       )
    );
  }
}
