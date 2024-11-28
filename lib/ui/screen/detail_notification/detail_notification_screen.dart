import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/models/notification_model.dart';
import 'package:glass/glass.dart';

import '../../../Core/Constants/constant_stataue.dart';
import '../../../Core/Helper/helper_function.dart';
import '../../../Core/Theme/app_colors.dart';
import '../../../Core/Theme/assets.gen.dart';
import '../../../Core/routes/routes_name.dart';
import '../../General/spacing_horizontal_widget.dart';
import '../../General/spacing_vertical_widget.dart';
import '../authorizator/widget/ring_of_avatar_widget.dart';

class DetailNotificationScreen extends StatelessWidget {
  const DetailNotificationScreen({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightComponentNotification = heightScreen / 10;
    String baseUrl = AppConstant.baseURL;
    String subDomain = notificationModel.userAction?.urlAvatar ?? "";
    String avatarImageUrl = baseUrl + subDomain;
    String name = notificationModel.userAction?.fullname ?? "Unknown";
    String content = notificationModel.message ?? "";
    bool isDarkMode = context.read<AuthBloc>().state.isDarkMode;
    String pathBackground = isDarkMode
        ? Assets.images.imageHoverGlassDarkMode.path.toString()
        : Assets.images.imageHoverGlassLightMode.path.toString();
    bool isSeen = notificationModel.isSeen ?? false;
    String dateCreate =
        convertTimeCreatePost(dateCreate: notificationModel.createdAt ?? "-");
    double widthComponentNotification =
        widthScreen - AppConstant.paddingComponent;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: '${notificationModel.id ?? 0}',
              child: Container(
                  width: widthComponentNotification,
                  decoration: BoxDecoration(
                    color: Theme.of(context).unselectedWidgetColor,
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusLarge),
                  ),
                  padding: const EdgeInsets.all(AppConstant.paddingComponent),
                  margin: const EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent + 3,
                      horizontal: AppConstant.paddingComponent),
                  child: Badge(
                    backgroundColor: Colors.redAccent,
                    isLabelVisible: !isSeen,
                    smallSize: AppConstant.radiusSmall,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, NavigatorNames.VIA_PROFILE,
                                  arguments: {
                                    'viaAccountId':
                                        notificationModel.userAction?.id ?? 0
                                  });
                            },
                            child: RingOfAvatarWidget(url: avatarImageUrl)),
                        const SpacingHorizontalWidget(
                          width: AppConstant.paddingIndicator,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    name,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        dateCreate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      const SpacingHorizontalWidget(
                                        width: AppConstant.paddingContent,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SpacingVerticalWidget(
                                height: AppConstant.paddingContent,
                              ),
                              Text(
                                content,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        )).asGlass(
            blurX: 20,
            blurY: 20,
            tintColor: isDarkMode ? AppColors.white : AppColors.black),
      ),
    ));
  }
}