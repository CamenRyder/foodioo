import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/routes/routes_name.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_event.dart';
import 'package:foodioo/repositories/blocs/home/home_state.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';

import 'package:foodioo/ui/screen/home%20/widget/app_bar_home_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../repositories/authentication/auth_bloc.dart';
import 'widget/create_post_widget.dart';
import 'widget/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  late ScrollController _scrollController;
  bool isLoading = false;
  int page = 1;
  late UserModel userModel;
  @override
  void initState() {
    super.initState();
    int currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    context
        .read<HomeBloc>()
        .add(InitalLoading(currentAccountId: currentAccountId));
    userModel = context.read<AuthBloc>().state.currentAccount ?? UserModel();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 600 &&
        isLoading == false) {
      isLoading = true;
      context.read<HomeBloc>().add(FetchNewFeed(
            page: ++page,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return current.message != previous.message ||
            current.isRefreshFeed == true;
      },
      builder: (context, state) {
        if (state.isShowMessage) {
          MessageToast.showToast(context, message: state.message);
        }
        if (state.isRefreshFeed) {
          refresh();
        }
        return Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     setState(() {});
            //   },
            // ),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  const AppBarHome(),
                  Expanded(child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoadingNewFeed) {
                        return Skeletonizer(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              const CreatePostWidget(),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 10,
                                  itemBuilder: (context, index) =>
                                      PostWidget.loading(context))
                            ],
                          ),
                        );
                      }

                      isLoading = false;
                      return RefreshIndicator(
                        onRefresh: () async {
                          refresh();
                        },
                        child: ListView(
                          shrinkWrap: true,
                          controller: _scrollController,
                          children: [
                            CreatePostWidget(
                              onTap: () async {
                                await Navigator.pushNamed(
                                    context, NavigatorNames.CREATE_POST);
                                refresh();
                              },
                              user: userModel,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.postModels.length,
                              itemBuilder: (context, index) => PostWidget(
                                postModel: state.postModels[index],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ))
                ],
              ),
            ));
      },
    );
  }

  void refresh() {
    page = 1;
    context.read<HomeBloc>().add(FetchNewFeed(page: page));
  }

  @override
  bool get wantKeepAlive => true;
}
