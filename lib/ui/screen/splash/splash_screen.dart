import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeIcon = 200; 
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: Center(
        child: Assets.avatar.appAvatar.image(height: sizeIcon, width: sizeIcon),
      ),
    );
  }
}
