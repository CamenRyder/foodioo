import 'package:flutter/material.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonReactWidget extends StatefulWidget {
  const ButtonReactWidget({super.key});

  @override
  State<ButtonReactWidget> createState() => _ButtonReactWidgetState();
}

class _ButtonReactWidgetState extends State<ButtonReactWidget> {
  bool reactPost = false;
  int count = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            reactPost = !reactPost;
            if (reactPost) {
              ++count;
            } else {
              --count;
            }
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgGenSizeWidget(
              icon: reactPost
                  ? Assets.icons.heart
                      .svg(color: Theme.of(context).primaryColor)
                  : Assets.icons.heart.svg(color: Theme.of(context).hintColor),
            ),
            const SpacingHorizontalWidget(
              width: 12,
            ),
            Text(
              "Cảm xúc ($count)",
              style: reactPost
                  ? Theme.of(context).textTheme.titleMedium
                  : Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ));
  }
}