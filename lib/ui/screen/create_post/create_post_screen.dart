import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_bloc.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_event.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_state.dart';
import 'package:foodioo/ui/General/loader_over_lay_widget.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/app_bar_create_post_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/post_iamges_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/title_bar_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'widget/input_description_widget.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  int currentAccountID = 0;
  @override
  void initState() {
    super.initState();
    currentAccountID = context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    context
        .read<CreatePostBloc>()
        .add(InitalLoadingCreatePost(currrentAccountId: currentAccountID));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
        listenWhen: (previous, current) =>
            current.isShowMessage != previous.isShowMessage ||
            current.isLoadingOverLay != previous.isLoadingOverLay ||
            current.isPosted == true,
        listener: (context, state) {
          if (state.isShowMessage) {
            MessageToast.showToast(context, message: state.message);
            if (state.isPosted) {
              Navigator.pop(context);
            }
          }
          if (state.isLoadingOverLay) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: const SafeArea(
            child: Column(
              children: [
                AppBarCreatePostWidget(),
                SpacingVerticalWidget(
                  height: 3,
                ),
                TitleBarWidget(),
                InputDescriptionWidget(),
                PostIamgesWidget(),
              ],
            ),
          ),
        ));
  }
}
