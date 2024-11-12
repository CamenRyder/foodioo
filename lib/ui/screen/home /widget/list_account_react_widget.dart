import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../repositories/blocs/home/home_bloc.dart';
import '../../../../repositories/blocs/home/home_event.dart';
import '../../../../repositories/blocs/home/home_state.dart';
import 'account_like_widget.dart';

class ListAccountReactWidget extends StatefulWidget {
  const ListAccountReactWidget({super.key, required this.postModel});
  final PostModel postModel;
  @override
  State<StatefulWidget> createState() {
    return _ListAccountReactWidgetState();
  }
}

class _ListAccountReactWidgetState extends State<ListAccountReactWidget> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
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
      page = 0;
      context.read<HomeBloc>().add(
          GetAccountReactPost(page: ++page, postId: widget.postModel.id ?? 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoadingAccountsReact) {
            return Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) =>
                  const Skeletonizer(child: AccountLikeWidget()),
            ));
          }
          final accountReacts = state.reactModels;
          isLoading = false;
          return ListView.builder(
            controller: _scrollController,
            itemCount: accountReacts.length,
            itemBuilder: (context, index) {
              return AccountLikeWidget(
                model: accountReacts[index],
              );
            },
          );
        },
      ),
    );
  }
}
