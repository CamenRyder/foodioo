import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/post_model.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import 'button_react_widget.dart';

class IntereactivePostWidget extends StatelessWidget {
  const IntereactivePostWidget({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    int totalComment = postModel.totalComment ?? 0;
    int totalLike = postModel.totalLike ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstant.paddingButton),
      child: Row(
        children: [
          Expanded(
              child: ButtonReactWidget(
            totalLike: totalLike,
            postModel: postModel,
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgGenSizeWidget(
                  icon:
                      Assets.icons.chat.svg(color: Theme.of(context).hintColor),
                ),
                const SpacingHorizontalWidget(
                  width: 12,
                ),
                Text(
                  "Bình luận ($totalComment)",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
