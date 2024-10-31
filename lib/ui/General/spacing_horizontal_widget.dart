import 'package:flutter/material.dart';

class SpacingHorizontalWidget extends StatelessWidget {
  final double? width;
  const SpacingHorizontalWidget({super.key, this.width});
  @override
  Widget build(BuildContext context) {
    return width == null
        ? const Expanded(child: SizedBox())
        : SizedBox(width: width);
  }
}
