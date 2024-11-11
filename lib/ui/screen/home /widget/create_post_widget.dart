import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const RingOfAvatarWidget(
                ringStyle: RingStyle.normal,
                url:
                    'http://foodioo.camenryder.xyz/upload/avatar/avatar_women_4.jpg'),
            Text(
              "Món ăn bạn muốn chia sẻ là gì ?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SvgGenSizeWidget(
              icon: Assets.icons.imagePicker
                  .svg(color: Theme.of(context).hintColor),
              isLargeSize: true,
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
