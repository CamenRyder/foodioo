import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/ui/General/image_customize_widget.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';
import 'package:foodioo/ui/general/svg_gen_size_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/ring_of_avatar_widget.dart';

import 'package:foodioo/ui/screen/home%20/widget/app_bar_home_widget.dart';

import '../../../Core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const AppBarHome(),
          Expanded(
              child: ListView(
            children: [
              const SpacingVerticalWidget(
                height: 12,
              ),
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
          ))
        ],
      ),
    ));
  }
}
