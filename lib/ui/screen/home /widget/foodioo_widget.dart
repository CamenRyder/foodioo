import 'package:flutter/material.dart';

import '../../../../core/constants/constant_stataue.dart';

class FoodiooWidget extends StatelessWidget {
  const FoodiooWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Foodioo",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Container(
          padding: EdgeInsets.zero,
          height: 5,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(AppConstant.radiusSmall)),
        )
      ],
    );
  }
}
