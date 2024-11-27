import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../../repositories/blocs/profile/profile_state.dart';
import '../../../../repositories/models/friend_status_model.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'add_friend_button_widget.dart';
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
    int currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
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
                bool isShowEditProfile =
                    state.viaAccountId == state.currentAccountId;
                // bool isShowAddFriend =
                //     state.typeFollwerCurrentAccountWithViaAccount ==
                //             TypeFollwer.stranger &&
                //         state.viaAccountId != state.currentAccountId;
                // bool isShowRemoveFriend =
                //     state.typeFollwerCurrentAccountWithViaAccount ==
                //         TypeFollwer.friend;
                // bool isShowRemoveRequested =
                //     state.typeFollwerCurrentAccountWithViaAccount ==
                //         TypeFollwer.request;

                // bool isShowAccept =
                //     state.typeFollwerCurrentAccountWithViaAccount ==
                //         TypeFollwer.accept;

                return Column(
                  children: [
                    isShowEditProfile
                        ? const ButtonEditWidget()
                        : MethodInteractButtonWidget(
                            typeFollower:
                                state.typeFollwerCurrentAccountWithViaAccount,
                            bloc: context.read<ProfileBloc>()),
                    QuickUploadPost()
                  ],
                );
                // : const SizedBox();
              },
            ),
            const PostProfileWidget(),
          ],
        ));
  }
}
