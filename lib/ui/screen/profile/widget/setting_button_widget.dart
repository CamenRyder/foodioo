import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/authentication/auth_event.dart';
import '../../../../repositories/authentication/auth_state.dart';
import '../../../General/dialog_confirm_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import '../../home /widget/list_title_customize_widget.dart';

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
                              ListTitleCustomizeWidget(
                                title: 'Nâng cấp tài khoản',
                                icon: Assets.icons.creditCard
                                    .svg(color: Theme.of(context).canvasColor),
                                func: () async {
                                  context
                                      .read<AuthBloc>()
                                      .add(ChangeVisibleModeSound());
                                  Navigator.pop(context);
                                },
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                buildWhen: (previous, current) =>
                                    previous.isEnableSound !=
                                    current.isEnableSound,
                                builder: (context, state) {
                                  return ListTitleCustomizeWidget(
                                    title: state.isEnableSound
                                        ? 'Tắt tiếng'
                                        : 'Mở tiếng',
                                    icon: state.isEnableSound
                                        ? Assets.icons.volumeOff.svg(
                                            color:
                                                Theme.of(context).canvasColor)
                                        : Assets.icons.volumeUp.svg(
                                            color:
                                                Theme.of(context).canvasColor),
                                    func: () async {
                                      context
                                          .read<AuthBloc>()
                                          .add(ChangeVisibleModeSound());
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return ListTitleCustomizeWidget(
                                    title: state.isEnableVibration
                                        ? 'Tắt rung'
                                        : 'Mở rung',
                                    icon: Assets.icons.musicNote.svg(
                                        color: Theme.of(context).canvasColor),
                                    func: () async {
                                      context
                                          .read<AuthBloc>()
                                          .add(ChangeEnableVibration());
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                buildWhen: (previous, current) =>
                                    previous.isDarkMode != current.isDarkMode,
                                builder: (context, state) {
                                  return ListTitleCustomizeWidget(
                                    title: state.isDarkMode
                                        ? 'Chế độ sáng'
                                        : 'Chế độ tối',
                                    icon: state.isDarkMode
                                        ? Assets.icons.sun.svg(
                                            color:
                                                Theme.of(context).canvasColor)
                                        : Assets.icons.moon.svg(
                                            color:
                                                Theme.of(context).canvasColor),
                                    func: () async {
                                      Navigator.pop(context);
                                      context
                                          .read<AuthBloc>()
                                          .add(ChangeVisibleMode());
                                    },
                                  );
                                },
                              ),
                              ListTitleCustomizeWidget(
                                title: 'Đăng xuất',
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Theme.of(context).canvasColor,
                                ),
                                func: () async {
                                  Navigator.pop(context);
                                  showDialog(
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
                              const SpacingVerticalWidget(
                                height: AppConstant.paddingComponent,
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
