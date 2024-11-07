import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/repositories/blocs/systems/system_bloc.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';
import 'package:foodioo/ui/general/svg_gen_size_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/ring_of_avatar_widget.dart';

import 'package:foodioo/ui/screen/home%20/widget/app_bar_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = context.read<SystemBloc>().state.scrollController;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const AppBarHome(),
          Expanded(
              child: ListView(
            controller: scrollController,
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
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
              const Divider(),
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
              const Divider(),
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
              const Divider(),
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
              const Divider(),
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
              const Divider(),
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
              const Divider(),
              Container(
                height: 300,
                width: 400,
                color: Colors.green,
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
