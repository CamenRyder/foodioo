import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';

import '../../authorizator/widget/ring_of_avatar_widget.dart';
import 'user_infor_post_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthScreen,
      child: const Column(
        children: [
          UserInforPostWidget(),
        ],
      ),
    );
  }
}
