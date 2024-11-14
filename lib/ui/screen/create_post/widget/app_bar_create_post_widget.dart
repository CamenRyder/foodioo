import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_bloc.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_event.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_state.dart';

import '../../../../Core/Theme/app_colors.dart';

class AppBarCreatePostWidget extends StatelessWidget {
  const AppBarCreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstant.paddingComponent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Chia sẻ bài viết",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          BlocBuilder<CreatePostBloc, CreatePostState>(
            buildWhen: (previous, current) {
              return previous.enableButtonCreatePost !=
                  current.enableButtonCreatePost;
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (state.enableButtonCreatePost) {
                    context.read<CreatePostBloc>().add(CreatePost());
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: AppConstant.paddingContent + 9),
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent,
                      horizontal: AppConstant.paddingContent + 9),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusMedium),
                    color: state.enableButtonCreatePost
                        ? Theme.of(context).primaryColor
                        : AppColors.grey50,
                  ),
                  child: Center(
                      child: Text("Đăng",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white))),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
