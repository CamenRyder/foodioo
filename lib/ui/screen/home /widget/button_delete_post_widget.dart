import 'package:flutter/material.dart';
import 'package:foodioo/ui/General/dialog_confirm_widget.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonDeletePostWidget extends StatelessWidget {
  const ButtonDeletePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // await showDialog(
        //     context: context,
        //     builder: (context) {
        //       return DialogConfirm(
        //         content: "Chắc chắn xóa bài viết này ?",
        //         textConfirm: "Xóa",
        //         textCancel: "Trở lại",
        //         func: () {
        //           Navigator.pop(context);
        //         },
        //         fucCancel: () {
        //           Navigator.pop(context);
        //         },
        //       );
        //     });
      },
      child: SvgGenSizeWidget(
          icon: Assets.icons.ban.svg(color: Theme.of(context).hintColor)),
    );
  }
}
