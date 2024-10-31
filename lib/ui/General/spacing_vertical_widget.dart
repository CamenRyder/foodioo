import 'package:flutter/material.dart';

class SpacingVerticalWidget extends StatelessWidget {
  final double? height;
  const SpacingVerticalWidget({super.key, this.height});
  @override
  Widget build(BuildContext context) {
    return height == null
        ? const Expanded(child: SizedBox())
        : SizedBox(height: height);
  }
}
