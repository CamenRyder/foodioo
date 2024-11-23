import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_event.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_avatar_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_background_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_fullname_widget.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';

class ButtonEditWidget extends StatelessWidget {
  const ButtonEditWidget({super.key, required this.currentAccountId});
  final int currentAccountId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonUpdateFullnameWidget(
                    currentAccountId: currentAccountId,
                    onCallBackRefreshAccout: () => context.read<ProfileBloc>().add(FetchAccountUser()),
                  ),
                  const Divider(
                    height: 0.1,
                    color: AppColors.grey,
                  ),
                  const ButtonUpdateAvatarWidget(),
                  const Divider(
                    height: 0.1,
                    color: AppColors.grey,
                  ),
                  const ButtonUpdateBackgroundWidget()
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor
        ),
        margin: const EdgeInsets.symmetric(
            vertical: AppConstant.paddingContent,
            horizontal: AppConstant.paddingHorizontalApp),
        padding: const EdgeInsets.symmetric(
            vertical: AppConstant.paddingContent + 5,
            horizontal: AppConstant.paddingHorizontalApp + 5),
        child: Text(
          "Chỉnh sửa cá nhân",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
