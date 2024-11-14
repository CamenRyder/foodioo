import 'package:flutter/material.dart';
import 'package:foodioo/Core/Theme/app_colors.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonEditPostWidget extends StatelessWidget {
  const ButtonEditPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          context: context,
          builder: (contextA) {
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
                    onTap: () {
                      Navigator.pop(context);
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
