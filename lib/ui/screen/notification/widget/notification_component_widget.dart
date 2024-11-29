import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/notification/notifcation_event.dart';
import 'package:foodioo/repositories/blocs/notification/notification_bloc.dart';
import 'package:foodioo/repositories/models/notification_model.dart';
import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Helper/helper_function.dart';
import '../../../../Core/routes/routes_name.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/spacing_vertical_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';

class NotificationComponentWidget extends StatelessWidget {
  const NotificationComponentWidget({super.key, this.notificationModel});
  final NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightComponentNotification = heightScreen / 10;
    String baseUrl = AppConstant.baseURL;
    String subDomain = notificationModel?.userAction?.urlAvatar ?? "";
    String avatarImageUrl = baseUrl + subDomain;
    String name = notificationModel?.userAction?.fullname ?? "Unknown";
    String content = notificationModel?.message ?? "";
    bool isSeen = notificationModel?.isSeen ?? false;
    String dateCreate =
        convertTimeCreatePost(dateCreate: notificationModel?.createdAt ?? "-");
    String urlImage =
        'https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2024/2/7/2024-01-28t180511z1178443544rc2gi5aomjs1rtrmadp3germany-ukraine-1707277688908652334379.jpg';
    double widthComponentNotification =
        widthScreen - AppConstant.paddingComponent;
    return Hero(
      tag: '${notificationModel?.id ?? 0}',
      child: Container(
          width: widthComponentNotification,
          decoration: BoxDecoration(
            color: Theme.of(context).unselectedWidgetColor,
            borderRadius: BorderRadius.circular(AppConstant.radiusLarge),
          ),
          padding: const EdgeInsets.all(AppConstant.paddingComponent),
          margin: const EdgeInsets.symmetric(
              vertical: AppConstant.paddingContent + 3,
              horizontal: AppConstant.paddingComponent),
          child: Badge(
            isLabelVisible: !isSeen,
            backgroundColor: Colors.redAccent,
            smallSize: AppConstant.radiusSmall,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, NavigatorNames.VIA_PROFILE, arguments: {
                        'viaAccountId': notificationModel?.userAction?.id ?? 0
                      });
                    },
                    child: RingOfAvatarWidget(url: avatarImageUrl)),
                const SpacingHorizontalWidget(
                  width: AppConstant.paddingIndicator,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final rs = await Navigator.pushNamed(
                          context, NavigatorNames.DETAIL_NOTIFICATION,
                          arguments: {
                            'notificationModel': notificationModel,
                          });
                      print(rs);
                      if (rs == 1) {
                        context.read<NotificationBloc>().add(SeenNotification(
                            notifcationId: notificationModel?.id ?? 0));
                      } else if (rs == 2) {
                      } else if (rs == 3) {
                      } else if (rs == 4) {}
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  dateCreate,
                                  style: Theme.of(context).textTheme.labelSmall,
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
                  ),
                )
              ],
            ),
          )),
    );
  }
}
