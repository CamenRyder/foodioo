import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodioo/Core/constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/list_requested_widget.dart';
import 'package:foodioo/ui/screen/profile/widget/list_waiting_accept_widget.dart';

import '../../../../Core/Theme/app_colors.dart';
import 'list_friend_widget.dart';

class BottomModalSheetPeopleAroundWidget extends StatefulWidget {
  const BottomModalSheetPeopleAroundWidget({super.key, required this.bloc});
  final ProfileBloc bloc;
  @override
  State<BottomModalSheetPeopleAroundWidget> createState() =>
      _BottomModalSheetPeopleAroundWidgetState();
}

class _BottomModalSheetPeopleAroundWidgetState
    extends State<BottomModalSheetPeopleAroundWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<String> listTitle = [
    "Bạn bè",
    "Phê duyệt",
    "Đang chờ",
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: listTitle.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double widthTabbar = MediaQuery.sizeOf(context).width / 3 - 60;
    final heighScreen = MediaQuery.sizeOf(context).height;
    // final sizeAvatar = widthTabbar / 1.5 + 12;
    // String urlImageTemp =
    //     'https://i.pinimg.com/550x/38/d0/e7/38d0e70f02cbef89d1968e3770977a6b.jpg';
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstant.paddingVerticalApp,
          horizontal: AppConstant.paddingHorizontalApp),
      height: heighScreen * 0.8,
      width: double.infinity,
      child: Column(
        children: [
          Center(
              child: Container(
            height: 6,
            width: 62,
            decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(3)),
          )),
          const SpacingVerticalWidget(
            height: 20,
          ),
          TabBar(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              isScrollable: false,
              dividerHeight: 4,
              onTap: (value) {},
              dividerColor: AppColors.grey50,
              dragStartBehavior: DragStartBehavior.down,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 4,
              tabAlignment: TabAlignment.center,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.only(
                  top: 9.5,
                  bottom: 13.5,
                  left: AppConstant.paddingHorizontalApp,
                  right: AppConstant.paddingHorizontalApp),
              labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelStyle: const TextStyle(
                  color: AppColors.grey50,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
              tabs: listTitle.map((e) {
                return Container(
                    width: widthTabbar,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                      ),
                    ));
              }).toList()),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            ListFriendWidget(
              bloc: widget.bloc,
            ),
            ListWaitingAcceptWidget(bloc: widget.bloc),
            ListRequestedWidget(bloc: widget.bloc,),
          ]))
        ],
      ),
    );
  }
}
