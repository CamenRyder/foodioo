import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Theme/app_colors.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_event.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/blocs/home/home_state.dart';
import '../../../General/dialog_confirm_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonEditPostWidget extends StatelessWidget {
  const ButtonEditPostWidget({super.key, this.postId});

  final int? postId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Assets.icons.edit
                        .svg(color: Theme.of(context).primaryColor),
                    title: Text(
                      'Chỉnh sửa bài viết',
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
                  ListTile(
                    leading: Icon(
                      Icons.delete_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Xóa bài viết',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () async {
                      Navigator.pop(context);

                      await showDialog(
                          context: context,
                          builder: (context) {
                            return BlocBuilder<HomeBloc, HomeState>(
                                buildWhen: (previous, current) =>
                                    current.isLoadingDeletePost !=
                                        previous.isLoadingDeletePost ||
                                    current.isRefreshFeed == true,
                                builder: (context, state) {
                                  if (state.isRefreshFeed) {
                                    Navigator.pop(context);
                                  }
                                  if (state.isLoadingDeletePost) {
                                    return DialogConfirm(
                                      content: "Chắc chắn xóa bài viết này ?",
                                      textConfirm: "Xóa",
                                      textCancel: "Trở lại",
                                      isLoading: true,
                                      func: () {
                                        // Navigator.pop(context);
                                      },
                                      fucCancel: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  }
                                  return DialogConfirm(
                                    content: "Chắc chắn xóa bài viết này ?",
                                    textConfirm: "Xóa",
                                    textCancel: "Trở lại",
                                    func: () {
                                      context
                                          .read<HomeBloc>()
                                          .add(DeletePost(postId: postId ?? 0));
                                    },
                                    fucCancel: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                });
                          });
                      // _takePicture(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SvgGenSizeWidget(
          icon: Assets.icons.edit.svg(color: Theme.of(context).hintColor)),
    );
  }
}
