import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../../repositories/blocs/profile/profile_state.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'button_edit_widget.dart';
import 'header_profile_widget.dart';
import 'post_profile_widget.dart';
import 'quick_upload_post_widget.dart';

class ScrollViewWidgets extends StatefulWidget {
  const ScrollViewWidgets({super.key});

  @override
  State<ScrollViewWidgets> createState() => _ScrollViewWidgetsState();
}

class _ScrollViewWidgetsState extends State<ScrollViewWidgets> {
  bool isLoading = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 600 &&
        isLoading == false) {
      isLoading = true;
      context.read<ProfileBloc>().add(FetchAccountPosts());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
                // buildWhen: (previous, current) =>
                //     previous.isLoadingScreen != current.isLoadingScreen ||
                //     previous.postModels != current.postModels,
                builder: (context, state) {
              if (state.isLoadingScreen) {
                return const Skeletonizer(child: HeaderProfileWidget());
              }
              isLoading = false;
              return HeaderProfileWidget(
                userModel: state.userModel,
              );
            }),
            const SpacingVerticalWidget(height: 12),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ButtonEditWidget(
                    currentAccountId: state.currentAccountId);
              },
            ),
            QuickUploadPost(),
            const PostProfileWidget(),
          ],
        ));
  }
}
