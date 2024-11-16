import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/comment/comment_event.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../repositories/blocs/comment/comment_bloc.dart';
import '../../../../repositories/blocs/comment/comment_state.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'comment_user_widget.dart';
import 'textfield_comments_widget.dart';

class BottomSheetCommentsWidget extends StatefulWidget {
  const BottomSheetCommentsWidget({super.key, this.totalComments = 0});
  final int totalComments;

  @override
  State<BottomSheetCommentsWidget> createState() =>
      _BottomSheetCommentsWidgetState();
}

class _BottomSheetCommentsWidgetState extends State<BottomSheetCommentsWidget> {
  int page = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 200 &&
        isLoading == false) {
      isLoading = true;
      context.read<CommentBloc>().add(FetchedComments(page: ++page));
    }
  }

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(AppConstant.radiusExtra);
    final widthBottomSheet = MediaQuery.sizeOf(context).width;
    final heighBottomSheet = MediaQuery.sizeOf(context).height * 0.9;
    const radiusRuler = Radius.circular(AppConstant.paddingContent);
    return Container(
      width: widthBottomSheet,
      height: heighBottomSheet,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(topLeft: radius, topRight: radius),
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
          Text("Bình luận (${widget.totalComments})",
              style: Theme.of(context).textTheme.headlineSmall),
          SpacingVerticalWidget(height: widthBottomSheet / 18),
          Container(
              width: widthBottomSheet,
              height: 1,
              color: Theme.of(context).hintColor),
          Expanded(child: BlocBuilder<CommentBloc, CommentState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Skeletonizer(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const CommentWidget(),
                ));
              }
              isLoading = false;
              return RefreshIndicator(
                onRefresh: () async {
                  page = 1;
                  context.read<CommentBloc>().add(FetchedComments(page: page));
                },
                child: ListView.builder(
                  itemCount: state.commentModels.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return CommentWidget(
                      model: state.commentModels[index],
                    );
                  },
                ),
              );
            },
          )),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.paddingComponent,
                vertical: AppConstant.paddingComponent),
            child: TextfieldCommentsWidget(),
          ),
        ],
      ),
    );
  }
}
