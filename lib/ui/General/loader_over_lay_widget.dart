import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodioo/core/theme/app_colors.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderOverLayWidget extends StatelessWidget {
  final Widget child;

  const LoaderOverLayWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
        overlayColor: Colors.grey.withOpacity(0.8),
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          return const Center(
              child: SpinKitThreeBounce(
            color: AppColorsLight.primary,
            size: 45,
          ));
        },
        child: child);
  }
}
