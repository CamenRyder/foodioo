import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_event.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/customize_button_widget.dart';
import '../../../General/spacing_vertical_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonUpdateAvatarWidget extends StatelessWidget {
  const ButtonUpdateAvatarWidget({super.key, required this.bloc});
  final ProfileBloc bloc;
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    final widthScreen = MediaQuery.sizeOf(context).width - 45;
    return ListTile(
        leading: SvgGenSizeWidget(
          icon: Assets.icons.imagePicker
              .svg(color: Theme.of(context).primaryColor),
        ),
        title: Text(
          'Cập nhập ảnh đại diện',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        onTap: () async {
          Navigator.pop(context);
          await showModalBottomSheet(
              context: context,
              builder: (context) {
                double sizeIcon = heightScreen * 0.12;
                final colorIcon = Theme.of(context).primaryColor;
                return Container(
                    height: heightScreen * 0.8,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Center(
                        child: Text(
                          "Cập nhật ảnh đại diện",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SpacingVerticalWidget(
                        height: 35,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        bloc: bloc,
                        builder: (context, state) {
                          if (state.isUpdateSuccess) {
                            Navigator.pop(context);
                          }
                          if (state.dynamicUpdateField.isNotEmpty) {
                            return Stack(
                              children: [
                                SizedBox(
                                  height: widthScreen,
                                  width: widthScreen,
                                  child: Image.file(
                                      File(state.dynamicUpdateField)),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          bloc.add(RemoveAvatarImage());
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(12),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromARGB(64, 84, 80, 80),
                                          ),
                                          padding: const EdgeInsets.all(
                                              AppConstant.paddingIcon),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ))),
                              ],
                            );
                          }
                          return Column(
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    final file = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (file != null) {
                                      bloc.add(ChangeAvatarImage(
                                          avatarUrl: file.path));
                                    }
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppConstant.radiusLarge),
                                        border: Border.all(
                                            color: colorIcon,
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
                                      ),
                                      padding: const EdgeInsets.all(
                                          AppConstant.paddingComponent),
                                      height: sizeIcon,
                                      width: sizeIcon,
                                      child: Assets.icons.imagePicker
                                          .svg(color: colorIcon)),
                                ),
                              ),
                              SizedBox(
                                height: sizeIcon / 2,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    final file = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);
                                    if (file != null) {
                                      bloc.add(ChangeAvatarImage(
                                          avatarUrl: file.path));
                                    }
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppConstant.radiusLarge),
                                        border: Border.all(
                                            color: colorIcon,
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
                                      ),
                                      padding: const EdgeInsets.all(
                                          AppConstant.paddingComponent),
                                      height: sizeIcon,
                                      width: sizeIcon,
                                      child: Assets.icons.camera
                                          .svg(color: colorIcon)),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const Expanded(child: SizedBox()),
                      CustomizeButtonWidget(
                        onPressed: () {
                          // MessageToast.showToast(context);
                          bloc.add(PostChangeAvatarImage());
                        },
                        title: "Cập nhật",
                        isEnable: true,
                      ),
                    ]));
              });
        });
  }
}
