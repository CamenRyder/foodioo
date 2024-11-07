import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/systems/system_bloc.dart';

import 'package:foodioo/ui/screen/home%20/widget/app_bar_home_widget.dart';

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
  Widget build(BuildContext context) {
    super.build(context);
    final scrollController = context.read<SystemBloc>().state.scrollController;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              const AppBarHome(),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                controller: scrollController,
                children: [
                  const CreatePostWidget(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) => const PostWidget(),
                  )
                ],
              ))
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
