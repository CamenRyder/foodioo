import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_typography.dart';
import '../../../../repositories/blocs/create_post/create_post_bloc.dart';
import '../../../../repositories/blocs/create_post/create_post_event.dart';

class InputDescriptionWidget extends StatelessWidget {
  const InputDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstant.paddingVerticalApp,
          horizontal: AppConstant.paddingVerticalApp),
      child: TextField(
        maxLines: 5,
        onChanged: (value) {
          if (value.isEmpty) {
            context
                .read<CreatePostBloc>()
                .add(DisableButtonCreatePost(description: value));
          } else {
            context
                .read<CreatePostBloc>()
                .add(EnableButtonCreatePost(description: value));
          }
        },
        // autofocus: false,
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
          fillColor: Color.fromARGB(255, 218, 218, 218),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppConstant.radiusExtra)),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
