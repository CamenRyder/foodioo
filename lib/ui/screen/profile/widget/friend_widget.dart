import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/constants/constant_stataue.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../../repositories/models/friend_status_model.dart';
import '../../../General/dialog_confirm_widget.dart';
import '../../../General/image_customize_widget.dart';
import '../../../General/spacing_horizontal_widget.dart';

class FriendWidget extends StatelessWidget {
  const FriendWidget({super.key, this.userModel, this.bloc});
  final UserModel? userModel;
  final ProfileBloc? bloc;
  @override
  Widget build(BuildContext context) {
    double widthTabbar = MediaQuery.sizeOf(context).width / 3 - 60;
    String avatar = userModel?.urlAvatar ?? "";
    String urlSubString = AppConstant.baseURL + avatar;
    String fullName = userModel?.fullname ?? "Nagato";
    final sizeAvatar = widthTabbar / 1.5 + 12;
    // String urlImageTemp =
    //     'https://i.pinimg.com/550x/38/d0/e7/38d0e70f02cbef89d1968e3770977a6b.jpg';
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
            GestureDetector(
              onTap: () async {
                final rs = await showDialog(
                    context: context,
                    builder: (context) {
                      return DialogConfirm(
                        content: "Bạn muốn hủy kết bạn?",
                        textConfirm: "Hủy",
                        textCancel: "Trở lại",
                        func: () {
                          bloc!.add(RemoveFriend(
                              friendAccountId: userModel?.id ?? 0));
                          Navigator.pop(context, true);
                        },
                        fucCancel: () {
                          Navigator.pop(context, false);
                        },
                      );
                    });
                if (rs) {
                  bloc!.add(RefreshListFriend(type: TypeFollwer.friend));
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hủy ",
                    style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SvgGenSizeWidget(
                      isLargeSize: true,
                      icon: Assets.icons.cancel
                          .svg(color: Theme.of(context).primaryColor))
                ],
              ),
            )
          ],
        ))
      ]),
    );
  }
}
