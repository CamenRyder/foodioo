import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../../repositories/blocs/profile/profile_state.dart';
import '../../../../repositories/models/friend_status_model.dart';
import '../../../general/spacing_vertical_widget.dart';
import 'waiting_user_accpet_widget.dart';

class ListWaitingAcceptWidget extends StatefulWidget {
  const ListWaitingAcceptWidget({super.key, required this.bloc});
  final ProfileBloc bloc;
  @override
  State<ListWaitingAcceptWidget> createState() =>
      _ListWaitingAcceptWidgetState();
}

class _ListWaitingAcceptWidgetState extends State<ListWaitingAcceptWidget> {
  late ScrollController _scrollController;
  bool isLoading = false;
  double widthBottomSheet = 0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 600 &&
        isLoading == false) {
      isLoading = true;
      widget.bloc.add(GetListFriends(type: TypeFollwer.accept));
    }
  }

  @override
  Widget build(BuildContext context) {
    widthBottomSheet = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state.isLoadingListAccept) {
          return Skeletonizer(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const WaitingUserAccpetWidget(),
          ));
        }
        return RefreshIndicator(
          onRefresh: () async =>
              widget.bloc.add(RefreshListFriend(type: TypeFollwer.accept)),
          child: state.followerList.isNotEmpty
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: state.followerList.length,
                  itemBuilder: (context, index) => WaitingUserAccpetWidget(
                    model: state.followerList[index],
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      SpacingVerticalWidget(
                        height: widthBottomSheet / 2,
                      ),
                      Lottie.asset(
                        'assets/icons/empty_box.json',
                        fit: BoxFit.fill,
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "Hỏng có bạn bè",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
