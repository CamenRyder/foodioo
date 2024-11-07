import 'package:flutter/material.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';

class UserInforPostWidget extends StatelessWidget {
  const UserInforPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    double spacingComponent = 9;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SpacingHorizontalWidget(
            width: 4,
          ),
          RingOfAvatarWidget(
              sizeAvatar: widthScreen / 8.5,
              ringStyle: RingStyle.normal,
              url:
                  'http://foodioo.camenryder.xyz/upload/avatar/avatar_men_3.jpg'),
          SpacingHorizontalWidget(
            width: spacingComponent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Lê Quang Minh",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SpacingHorizontalWidget(
                    width: spacingComponent / 2,
                  ),
                  SvgGenSizeWidget(
                      icon: Assets.icons.addUser
                          .svg(color: Theme.of(context).hintColor)),
                ],
              ),
              Text(
                "37 phút trước",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const Spacer(),
          SvgGenSizeWidget(
              icon: Assets.icons.ban.svg(color: Theme.of(context).hintColor)),
          SpacingHorizontalWidget(
            width: spacingComponent,
          ),
        ],
      ),
    );
  }
}
