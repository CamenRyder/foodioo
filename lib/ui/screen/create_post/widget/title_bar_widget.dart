import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';
import 'get_image_widget.dart';

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({super.key, this.userModels});
  final UserModel? userModels;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.sizeOf(context).width;
    String name = userModels?.fullname ?? "Foodioo";

    String subAvatar = userModels?.urlAvatar ?? "";
    String avatarUrl = AppConstant.baseURL + subAvatar;
    return Row(children: [
      const SpacingHorizontalWidget(
        width: AppConstant.paddingComponent - 3,
      ),
      RingOfAvatarWidget(
        url: avatarUrl,
        ringStyle: RingStyle.normal,
        sizeAvatar: widthScreen / 8.5,
      ),
      const SpacingHorizontalWidget(
        width: AppConstant.paddingComponent,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SpacingHorizontalWidget(
            width: 3,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  MessageToast.showToast(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent,
                      horizontal: AppConstant.paddingContent + 5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusMedium),
                    color: AppColors.grey50,
                  ),
                  child: Center(
                      child: Text("Thêm thẻ",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white))),
                ),
              ),
              const SpacingHorizontalWidget(
                width: 7,
              ),
              GestureDetector(
                onTap: () => MessageToast.showToast(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent,
                      horizontal: AppConstant.paddingContent + 5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusMedium),
                    color: AppColors.grey50,
                  ),
                  child: Center(
                      child: Text("Chia sẻ vị trí",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white))),
                ),
              )
            ],
          )
        ],
      ),
      const SpacingHorizontalWidget(),
      const GetImageWidget(),
      const SpacingHorizontalWidget(
        width: 12,
      ),
    ]);
  }
}
