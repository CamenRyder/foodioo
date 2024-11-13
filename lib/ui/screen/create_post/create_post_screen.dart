import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_bloc.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_event.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/app_bar_create_post_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/title_bar_widget.dart';
import '../../../repositories/blocs/create_post/create_post_state.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCreatePostWidget(),
            const SpacingVerticalWidget(
              height: 3,
            ),
            const TitleBarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstant.paddingVerticalApp,
                  horizontal: AppConstant.paddingVerticalApp),
              child: TextField(
                maxLines: 5,
                // controller: textEdt02,
                onChanged: (value) {},
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
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstant.radiusExtra)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(child: BlocBuilder<CreatePostBloc, CreatePostState>(
              builder: (context, state) {
                if (state.images.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(
                              AppConstant.paddingComponent),
                          child: Stack(
                            children: [
                              Image.file(
                                File(state.images[index].path),
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<CreatePostBloc>()
                                        .add(RemoveImage(index: index));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(
                                        AppConstant.paddingComponent),
                                    padding: const EdgeInsets.all(
                                        AppConstant.paddingContent),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(134, 15, 15, 15)),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ));
                    },
                  );
                }
                return const SizedBox();
              },
            ))
          ],
        ),
      ),
    );
  }
}
