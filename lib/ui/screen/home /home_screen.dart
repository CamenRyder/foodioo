import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/ui/screen/home%20/widget/app_bar_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [AppBarHome()],
      ),
    ));
  }
}
