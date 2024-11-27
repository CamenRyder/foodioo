import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';

class ListTitleCustomizeWidget extends StatelessWidget {
  const ListTitleCustomizeWidget(
      {super.key, required this.title, required this.icon, required this.func});
  final VoidCallback func;
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
          margin: const EdgeInsets.all(AppConstant.paddingContent),
          padding: const EdgeInsets.all(AppConstant.paddingButton),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(
                Radius.circular(AppConstant.radiusMedium)),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            icon
          ])),
    );
  }
}
