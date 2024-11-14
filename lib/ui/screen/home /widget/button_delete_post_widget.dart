import 'package:flutter/material.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonDeletePostWidget extends StatelessWidget {
  const ButtonDeletePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SvgGenSizeWidget(
          icon: Assets.icons.ban.svg(color: Theme.of(context).hintColor)),
    );
  }
}
