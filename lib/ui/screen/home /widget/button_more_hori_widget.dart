import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/repositories/blocs/comment/comment_bloc.dart';
import 'package:foodioo/repositories/blocs/comment/comment_state.dart';
import 'package:foodioo/repositories/models/comments_model.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../General/dialog_confirm_widget.dart';

class ButtonMoreHoriWidget extends StatelessWidget {
  const ButtonMoreHoriWidget({super.key, this.commentModel});
  final CommentModel? commentModel;
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
                      'Chỉnh sửa bình luận',
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
                      'Xóa bình luận',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () async {
                      // Navigator.pop(context);
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return DialogConfirm(
                            content: "Chắc chắn xóa bình luận  này ?",
                            textConfirm: "Xóa",
                            textCancel: "Trở lại",
                            func: () {
                              Navigator.pop(context);
                            },
                            fucCancel: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      );

                      // _takePicture(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(3),
        child: Icon(Icons.more_horiz),
      ),
    );
  }
}
