import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/home%20/widget/list_title_customize_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../../repositories/blocs/profile/profile_state.dart';
import '../../../General/customize_button_widget.dart';

class ButtonUpdateBackgroundWidget extends StatelessWidget {
  const ButtonUpdateBackgroundWidget({super.key, required this.bloc});
  final ProfileBloc bloc;
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    return ListTitleCustomizeWidget(
        title: "Cập nhật ảnh bìa",
        icon:
            Assets.icons.imagePicker.svg(color: Theme.of(context).canvasColor),
        func: () async {
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
                          "Cập nhật ảnh bìa",
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
                            return Center(
                              child: Stack(
                                children: [
                                  Image.file(File(state.dynamicUpdateField)),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            bloc.add(
                                                RemoveChangeBackgroundImage());
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(12),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  64, 84, 80, 80),
                                            ),
                                            padding: const EdgeInsets.all(
                                                AppConstant.paddingIcon),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ))),
                                ],
                              ),
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
                                      bloc.add(ChangeBackgroundImage(
                                          backgroundImageUrl: file.path));
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
                                      bloc.add(ChangeBackgroundImage(
                                          backgroundImageUrl: file.path));
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
                          bloc.add(PostChangeBackgroundImage());
                        },
                        title: "Cập nhật",
                        isEnable: true,
                      ),
                    ]));
              });
        });
  }
}
