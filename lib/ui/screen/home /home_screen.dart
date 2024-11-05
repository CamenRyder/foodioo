import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Trang chủ",
        style: AppTypographyLight.textContent,
      ),
    ));
  }
}
