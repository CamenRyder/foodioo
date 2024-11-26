import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/models/friend_status_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/constants/constant_stataue.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../General/dialog_confirm_widget.dart';
import '../../../General/image_customize_widget.dart';
import '../../../General/spacing_horizontal_widget.dart';

class WaitingUserAccpetWidget extends StatelessWidget {
  const WaitingUserAccpetWidget({super.key, this.model, this.bloc});
  final UserModel? model;
  final ProfileBloc? bloc;
  @override
  Widget build(BuildContext context) {
    double widthTabbar = MediaQuery.sizeOf(context).width / 3 - 60;
    final sizeAvatar = widthTabbar / 1.5 + 12;
    String avatar = model?.urlAvatar ?? "";
    String urlSubString = AppConstant.baseURL + avatar;
    String fullName = model?.fullname ?? "Nagato";
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.paddingContent,
          vertical: AppConstant.paddingComponent),
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(AppConstant.radiusLarge)),
      padding: const EdgeInsets.symmetric(
          vertical: AppConstant.paddingContent + 2,
          horizontal: AppConstant.paddingHorizontalApp),
      child: Row(children: [
        CustomImage(
          radius: 120,
          url: urlSubString,
          size: sizeAvatar,
        ),
        const SpacingHorizontalWidget(
          width: AppConstant.paddingButton,
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fullName,
              style: const TextStyle(
                color: AppColorsLight.textContent,
                fontSize: AppConstant.textSizeButton,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () async {
                    final rs = await showDialog(
                        context: context,
                        builder: (context) {
                          return DialogConfirm(
                            content: "Huỷ lời mời kết bạn?",
                            textConfirm: "Hủy luôn",
                            textCancel: "Trở lại",
                            func: () {
                              bloc!.add(RemoveFriend(
                                  friendAccountId: model?.id ?? 0));
                              Navigator.pop(context, true);
                            },
                            fucCancel: () {
                              Navigator.pop(context, false);
                            },
                          );
                        });
                    if (rs) {
                      bloc!.add(RefreshListFriend(type: TypeFollwer.accept));
                    }
                  },
                  icon: SvgGenSizeWidget(
                      isLargeSize: true,
                      icon: Assets.icons.cancel
                          .svg(color: Theme.of(context).primaryColor)),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () async {
                    final rs = await showDialog(
                        context: context,
                        builder: (context) {
                          return DialogConfirm(
                            content: "Chấp nhận kết bạn?",
                            textConfirm: "Chấp nhận",
                            textCancel: "Trở lại",
                            func: () {
                              bloc!.add(AcceptFollower(
                                  followerAccountId: model?.id ?? 0));
                              Navigator.pop(context, true);
                            },
                            fucCancel: () {
                              Navigator.pop(context, false);
                            },
                          );
                        });
                    if (rs) {
                      bloc!.add(RefreshListFriend(type: TypeFollwer.accept));
                    }
                  },
                  icon: SvgGenSizeWidget(
                      isLargeSize: true,
                      icon: Assets.icons.accept
                          .svg(color: Theme.of(context).primaryColor)),
                )
              ],
            )
          ],
        ))
      ]),
    );
  }
}
