import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/comment/comment_bloc.dart';
import 'package:foodioo/repositories/blocs/comment/comment_event.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/ui/General/loader_over_lay_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/blocs/comment/comment_state.dart';
import '../../../General/message_over_screen.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import 'bottom_sheet_comments_widget.dart';

class ButtonCommentWidget extends StatefulWidget {
  const ButtonCommentWidget(
      {super.key, required this.postModel, required this.totalComments});
  final int totalComments;
  final PostModel postModel;

  @override
  State<StatefulWidget> createState() {
    return ButtonCommentWidgetState();
  }
}

class ButtonCommentWidgetState extends State<ButtonCommentWidget> {
  int currentAccountId = 0;
  @override
  void initState() {
    super.initState();
    currentAccountId = context.read<AuthBloc>().state.currentAccount?.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return BlocProvider(
                  create: (context) {
                    final commentBloc = CommentBloc();
                    commentBloc.add(InitialLoaingComments(
                        currentAccounId: currentAccountId,
                        postId: widget.postModel.id ?? 0));
                    return commentBloc;
                  },
                  child: BlocBuilder<CommentBloc, CommentState>(
                      buildWhen: (previous, current) {
                    return previous.isPosting != current.isPosting ||
                        previous.isShowMessage == true;
                  }, builder: (context, state) {
                    if (state.isPosting) {
                      context.loaderOverlay.show();
                    } else {
                      context.loaderOverlay.hide();
                    }
                    // if (state.isShowMessage) {
                    //   MessageToast.showToast(context, message: state.message);
                    // }
                    return BottomSheetCommentsWidget(
                      totalComments: widget.totalComments,
                    );
                  }));
            });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgGenSizeWidget(
            icon: Assets.icons.chat.svg(color: Theme.of(context).hintColor),
          ),
          const SpacingHorizontalWidget(
            width: 12,
          ),
          Text(
            "Bình luận (${widget.totalComments})",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
