// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/ui/screen/home%20/widget/button_ban_post_widget.dart';

import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/models/post_model.dart';
import 'button_edit_post_widget.dart';

class ButtonQuickMethodWidget extends StatelessWidget {
  const ButtonQuickMethodWidget({
    super.key,
    this.postModel,
  });
  final PostModel? postModel;

  @override
  Widget build(BuildContext context) {
    bool isYours = false;
    int currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    int postAccountId = postModel?.accountId ?? -1;
    int postId = postModel?.id ?? 0;
    if (currentAccountId == postAccountId) {
      isYours = true;
    }
    return isYours
        ? ButtonEditPostWidget(
            postId: postId,
          )
        : const ButtonBanPostWidget();
  }
}
