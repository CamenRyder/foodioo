import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';

class ButtonEditWidget extends StatelessWidget {
  const ButtonEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
          // boxShadow: [
          //   // BoxShadow(
          //   //   color: Colors.grey.withOpacity(0.5),
          //   //   spreadRadius: 2,
          //   //   blurRadius: 5,
          //   //   offset: const Offset(0, 3),
          //   // ),
          // ],
        ),
        margin: const EdgeInsets.symmetric(
            vertical: AppConstant.paddingContent,
            horizontal: AppConstant.paddingHorizontalApp),
        padding: const EdgeInsets.symmetric(
            vertical: AppConstant.paddingContent + 5,
            horizontal: AppConstant.paddingHorizontalApp + 5),
        child: Text(
          "Chỉnh sửa cá nhân",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
