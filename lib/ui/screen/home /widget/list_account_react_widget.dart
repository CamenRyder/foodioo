import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../repositories/blocs/home/home_bloc.dart';
import '../../../../repositories/blocs/home/home_event.dart';
import '../../../../repositories/blocs/home/home_state.dart';
import '../../../General/spacing_vertical_widget.dart';
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

    context
        .read<HomeBloc>()
        .add(GetAccountReactPost(postId: widget.postModel.id ?? 0));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 200 &&
        isLoading == false) {
      isLoading = true;
      context.read<HomeBloc>().add(
          GetAccountReactPost(page: ++page, postId: widget.postModel.id ?? 0));
    }
  }

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Builds a widget tree that displays a list of account reactions for a post.
  ///
  /// The widget uses a [BlocBuilder] to listen to the state of the [HomeBloc].
  /// If the state indicates that account reactions are loading, a skeleton
  /// loading animation is shown. If there are no account reactions, a
  /// placeholder with a message is displayed. Otherwise, a [ListView] is shown
  /// with [AccountLikeWidget]s for each account reaction. The list supports
  /// pull-to-refresh functionality and automatically fetches more reactions
  /// when scrolled to the bottom.
/******  1e984e8f-7339-4c7f-8aa1-97dbf7d02b50  *******/
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
          if (accountReacts.isEmpty) {
            return Center(
              child: Column(
                children: [
                  const SpacingVerticalWidget(
                    height: 25,
                  ),
                  Lottie.asset(
                    'assets/icons/empty_box.json',
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    "Hỏng có tương tác",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              page = 0;
              context
                  .read<HomeBloc>()
                  .add(GetAccountReactPost(postId: widget.postModel.id ?? 0));
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: accountReacts.length,
              itemBuilder: (context, index) {
                return AccountLikeWidget(
                  model: accountReacts[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
