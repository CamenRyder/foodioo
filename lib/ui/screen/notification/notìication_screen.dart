import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightComponentNotification = heightScreen / 12;
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

          Container(
            height: heightComponentNotification,
            width: widthComponentNotification,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(AppConstant.radiusLarge),
            ),
            padding: const EdgeInsets.all(AppConstant.paddingComponent),
            child: Text(
              'Bạn có thông báo bài viết',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          // Expanded(child: ListView.builder(itemBuilder: ))
        ],
      ),
    ));
  }
}
