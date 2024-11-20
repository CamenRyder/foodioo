
import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container();
            },
          );
        },
        child: Container(
            margin: const EdgeInsets.only(top: 10, right: 20),
            padding: const EdgeInsets.all(AppConstant.paddingContent),
            decoration: const BoxDecoration(
                color: Colors.black45, shape: BoxShape.circle),
            child: SvgGenSizeWidget(
                icon: Assets.icons.setting.svg(
              color: Colors.white,
            ))),
      ),
    );
  }
}
