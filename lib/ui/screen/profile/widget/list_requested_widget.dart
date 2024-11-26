import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../../repositories/blocs/profile/profile_state.dart';
import '../../../../repositories/models/friend_status_model.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'friend_widget.dart';

class ListRequestedWidget extends StatefulWidget {
  const ListRequestedWidget({super.key, required this.bloc});
  final ProfileBloc bloc;

  @override
  State<ListRequestedWidget> createState() => _ListRequestedWidgetState();
}

class _ListRequestedWidgetState extends State<ListRequestedWidget> {
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
      widget.bloc.add(GetListFriends(type: TypeFollwer.request));
    }
  }

  @override
  Widget build(BuildContext context) {
    widthBottomSheet = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state.isLoadingListRequested) {
          return Skeletonizer(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const FriendWidget(),
          ));
        }
        return RefreshIndicator(
          onRefresh: () async => context
              .read<ProfileBloc>()
              .add(RefreshListFriend(type: TypeFollwer.request)),
          child: state.requestedList.isNotEmpty
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: state.requestedList.length,
                  itemBuilder: (context, index) => FriendWidget(
                    userModel: state.requestedList[index],
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
