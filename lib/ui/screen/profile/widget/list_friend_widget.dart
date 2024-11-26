import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/friend_status_model.dart';
import 'package:foodioo/ui/screen/profile/widget/friend_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../General/spacing_vertical_widget.dart';

class ListFriendWidget extends StatefulWidget {
  const ListFriendWidget({super.key , required this.bloc });
  final ProfileBloc bloc; 

  @override
  State<ListFriendWidget> createState() => _ListFriendWidgetState();
}

class _ListFriendWidgetState extends State<ListFriendWidget> {
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
      widget.bloc.add(GetListFriends(type: TypeFollwer.friend));
    }
  }

  @override
  Widget build(BuildContext context) {
    widthBottomSheet = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc:  widget.bloc,
      builder: (context, state) {
        if (state.isLoadingListFriend) {
          return Skeletonizer(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const FriendWidget(),
          ));
        }
        return RefreshIndicator(
          onRefresh: () async => context
              .read<ProfileBloc>()
              .add(RefreshListFriend(type: TypeFollwer.friend)),
          child: state.friendList.isNotEmpty
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: state.friendList.length,
                  itemBuilder: (context, index) => FriendWidget(
                    userModel: state.friendList[index],
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
