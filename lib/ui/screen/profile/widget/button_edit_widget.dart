import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_avatar_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/button_update_background_widget.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'button_update_fullname_widget.dart';

class ButtonEditWidget extends StatelessWidget {
  const ButtonEditWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // typeFollwerCurrentAccountWithViaAccount
        const Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () async {
            final profileBloc = context.read<ProfileBloc>();
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (contexat) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Container(
                          height: 6,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(
                                AppConstant.paddingContent),
                          ),
                        ),
                      ),
                      const SpacingVerticalWidget(
                        height: AppConstant.paddingComponent,
                      ),
                      ButtonUpdateFullnameWidget(bloc: profileBloc),
                      ButtonUpdateAvatarWidget(
                        bloc: profileBloc,
                      ),
                      ButtonUpdateBackgroundWidget(
                        bloc: profileBloc,
                      ),
                      const SpacingVerticalWidget(
                        height: AppConstant.paddingComponent,
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
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
        )
      ],
    );
  }
}
