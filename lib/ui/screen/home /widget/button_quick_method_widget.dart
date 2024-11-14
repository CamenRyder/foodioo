// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/models/post_model.dart';
import '../../../General/svg_gen_size_widget.dart';
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
    if (currentAccountId == postAccountId) {
      isYours = true;
    }
    return isYours
        ? const ButtonEditPostWidget()
        : GestureDetector(
            onTap: () {},
            child: SvgGenSizeWidget(
                icon: Assets.icons.ban.svg(color: Theme.of(context).hintColor)),
          );
  }
}
