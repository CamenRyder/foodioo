import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_event.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import 'list_account_react_widget.dart';

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
  final radius = const Radius.circular(AppConstant.radiusExtra);
  @override
  void initState() {
    super.initState();
    count = widget.totalLike;

    reactPost = widget.postModel.reactState?.state != 0 ? true : false;
    // if (widget.postModel.reactState?.accountId != null) {
    //   bool index = widget.postModel.reactState!.accountId == accountCurrent;
    //   if (!index) {
    //     reactPost = false;
    //   } else {
    //     reactPost = true;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                final widthBottomSheet = MediaQuery.sizeOf(context).width;
                const radiusRuler = Radius.circular(AppConstant.paddingContent);
                return Container(
                  width: widthBottomSheet,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: radius, topRight: radius),
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Column(
                    children: [
                      SpacingVerticalWidget(height: widthBottomSheet / 25),
                      Container(
                        height: widthBottomSheet / 100,
                        width: widthBottomSheet / 8,
                        decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: const BorderRadius.all(radiusRuler)),
                      ),
                      SpacingVerticalWidget(height: widthBottomSheet / 20),
                      Text("Cảm xúc ($count)",
                          style: Theme.of(context).textTheme.headlineSmall),
                      SpacingVerticalWidget(height: widthBottomSheet / 18),
                      Container(
                          width: widthBottomSheet,
                          height: 1,
                          color: Theme.of(context).hintColor),
                      ListAccountReactWidget(
                        postModel: widget.postModel,
                      ),
                    ],
                  ),
                );
              });
        },
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
