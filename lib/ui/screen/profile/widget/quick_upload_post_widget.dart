import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/app_colors.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';

import '../../../../repositories/blocs/profile/profile_event.dart';

class QuickUploadPost extends StatelessWidget {
  QuickUploadPost({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstant.paddingComponent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12, bottom: 3),
                child: Text(
                  "Chia sẻ nhanh",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (previous, current) {
                  return previous.description != current.description;
                },
                builder: (context, state) {
                  bool isEnable = state.description.isNotEmpty;
                  return GestureDetector(
                    onTap: () {
                      if (isEnable) {
                        context.read<ProfileBloc>().add(FastUploadPost());
                        controller.clear();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 3, bottom: 3),
                      padding: const EdgeInsets.symmetric(
                          vertical: AppConstant.paddingContent,
                          horizontal: AppConstant.paddingComponent),
                      decoration: BoxDecoration(
                          color: isEnable
                              ? Theme.of(context).primaryColor
                              : AppColors.grey50,
                          borderRadius:
                              BorderRadius.circular(AppConstant.radiusMedium)),
                      child: const Text("Đăng",
                          style: AppTypographyLight.textHintBoldWhite),
                    ),
                  );
                },
              )
            ],
          ),
          TextField(
            maxLines: 2,
            controller: controller,
            onChanged: (value) {
              context
                  .read<ProfileBloc>()
                  .add(InputDescriptionToUploadPost(description: value));
            },
            style: Theme.of(context).textTheme.bodyLarge, // displaySmall
            decoration: const InputDecoration(
              hintText: "Nhập nội dung chia sẻ",
              filled: true,
              hintStyle: AppTypographyLight.textHintBold,
              contentPadding: EdgeInsets.symmetric(
                  vertical: AppConstant.paddingVerticalApp,
                  horizontal: AppConstant.paddingVerticalApp),
              labelStyle: AppTypographyLight.textContentBold,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Color.fromARGB(255, 234, 234, 234),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppConstant.radiusExtra)),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
