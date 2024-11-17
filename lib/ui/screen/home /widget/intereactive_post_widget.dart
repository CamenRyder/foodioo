import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/post_model.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import 'button_comment_widget.dart';
import 'button_react_widget.dart';

class IntereactivePostWidget extends StatelessWidget {
  const IntereactivePostWidget({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    int totalComment = postModel.totalComment ?? 0;
    int totalLike = postModel.totalLike ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstant.paddingButton),
      child: Row(
        children: [
          Expanded(
              child: ButtonReactWidget(
            totalLike: totalLike,
            postModel: postModel,
          )),
          Expanded(
            child: ButtonCommentWidget(
              totalComments: totalComment,
              postModel: postModel,
            ),
          )
        ],
      ),
    );
  }
}
