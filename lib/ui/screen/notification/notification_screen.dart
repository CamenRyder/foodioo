import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/ring_of_avatar_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Core/Theme/app_colors.dart';
import 'widget/notification_component_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightComponentNotification = heightScreen / 12;
    String urlImage =
        'https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2024/2/7/2024-01-28t180511z1178443544rc2gi5aomjs1rtrmadp3germany-ukraine-1707277688908652334379.jpg';
    double widthComponentNotification =
        widthScreen - AppConstant.paddingComponent;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: Text(
              "Thông báo",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SpacingVerticalWidget(
            height: AppConstant.paddingComponent,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const NotificationComponentWidget();
              },
            ),
          )
          // Expanded(child: ListView.builder(itemBuilder: ))
        ],
      ),
    ));
  }
}
