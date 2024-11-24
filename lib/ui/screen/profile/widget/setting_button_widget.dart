import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/authentication/auth_event.dart';
import '../../../../repositories/authentication/auth_state.dart';
import '../../../General/dialog_confirm_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    int viaAccountId = context.read<ProfileBloc>().state.viaAccountId;
    bool isUserAcount = currentAccountId == viaAccountId;
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isUserAcount
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      padding: const EdgeInsets.all(AppConstant.paddingContent),
                      decoration: const BoxDecoration(
                          color: Colors.black45, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: AppConstant.sizeIconMedium,
                      )),
                ),
          isUserAcount
              ? GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Assets.icons.creditCard
                                    .svg(color: Theme.of(context).primaryColor),
                                title: Text(
                                  'Nâng cấp tài khoản',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  // style: TextStyle(
                                  //     color: AppColors.secondary, fontSize: 14),
                                ),
                                // onTap: () async => _pickImage(context),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.grey,
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                buildWhen: (previous, current) =>
                                    previous.isEnableSound !=
                                    current.isEnableSound,
                                builder: (context, state) {
                                  return ListTile(
                                    leading: state.isEnableSound
                                        ? Assets.icons.volumeOff.svg(
                                            color:
                                                Theme.of(context).primaryColor)
                                        : Assets.icons.volumeUp.svg(
                                            color:
                                                Theme.of(context).primaryColor),
                                    title: Text(
                                      state.isEnableSound
                                          ? 'Tắt tiếng'
                                          : 'Mở tiếng',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    onTap: () async {
                                      context
                                          .read<AuthBloc>()
                                          .add(ChangeVisibleModeSound());
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.grey,
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return ListTile(
                                    leading: Assets.icons.musicNote.svg(
                                        color: Theme.of(context).primaryColor),
                                    title: Text(
                                      state.isEnableVibration
                                          ? 'Tắt rung'
                                          : 'Mở rung',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    onTap: () async {
                                      context
                                          .read<AuthBloc>()
                                          .add(ChangeEnableVibration());
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.grey,
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                buildWhen: (previous, current) =>
                                    previous.isDarkMode != current.isDarkMode,
                                builder: (context, state) {
                                  return ListTile(
                                    leading: state.isDarkMode
                                        ? Assets.icons.sun.svg(
                                            color:
                                                Theme.of(context).primaryColor)
                                        : Assets.icons.moon.svg(
                                            color:
                                                Theme.of(context).primaryColor),
                                    title: Text(
                                      state.isDarkMode
                                          ? 'Chế độ sáng'
                                          : 'Chế độ tối',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    onTap: () {
                                      context
                                          .read<AuthBloc>()
                                          .add(ChangeVisibleMode());
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.grey,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.delete_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  'Đăng xuất',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                onTap: () async {
                                  Navigator.pop(context);
                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DialogConfirm(
                                          content:
                                              "Bạn chắc chắn muốn đăng xuất?",
                                          textConfirm: "Đồng ý",
                                          textCancel: "Trở lại",
                                          func: () {
                                            context
                                                .read<AuthBloc>()
                                                .add(Logout());
                                            Navigator.pop(context);
                                          },
                                          fucCancel: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 20),
                      padding: const EdgeInsets.all(AppConstant.paddingContent),
                      decoration: const BoxDecoration(
                          color: Colors.black45, shape: BoxShape.circle),
                      child: SvgGenSizeWidget(
                          icon: Assets.icons.setting.svg(
                        color: Colors.white,
                      ))),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
