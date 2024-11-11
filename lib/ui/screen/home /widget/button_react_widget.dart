import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_event.dart';
import 'package:foodioo/repositories/models/post_model.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonReactWidget extends StatefulWidget {
  const ButtonReactWidget(
      {super.key, required this.postModel, required this.totalLike});
  final PostModel postModel;
  final int totalLike;

  @override
  State<ButtonReactWidget> createState() => _ButtonReactWidgetState();
}

class _ButtonReactWidgetState extends State<ButtonReactWidget> {
  bool reactPost = false;
  int count = 0;
  @override
  void initState() {
    super.initState();
    count = widget.totalLike;
    int accountCurrent =
        (context.read<AuthBloc>().state).currentAccount?.id ?? 0;
    if (widget.postModel.accountLikes != null) {
      int index = widget.postModel.accountLikes!.indexOf(accountCurrent);
      if (index == -1) {
        reactPost = false;
      } else {
        reactPost = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            reactPost = !reactPost;
            if (reactPost) {
              ++count;
              context
                  .read<HomeBloc>()
                  .add(LikePost(postId: widget.postModel.id ?? 0));
            } else {
              --count;
              context
                  .read<HomeBloc>()
                  .add(UnLikePost(postId: widget.postModel.id ?? 0));
            }
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgGenSizeWidget(
              icon: reactPost
                  ? Assets.icons.heart
                      .svg(color: Theme.of(context).primaryColor)
                  : Assets.icons.heart.svg(color: Theme.of(context).hintColor),
            ),
            const SpacingHorizontalWidget(
              width: 12,
            ),
            Text(
              "Cảm xúc ($count)",
              style: reactPost
                  ? Theme.of(context).textTheme.titleMedium
                  : Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ));
  }
}
