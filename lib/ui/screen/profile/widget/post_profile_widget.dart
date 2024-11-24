import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../home /widget/create_post_widget.dart';
import '../../home /widget/post_widget.dart';

class PostProfileWidget extends StatefulWidget {
  const PostProfileWidget({super.key});

  @override
  State<PostProfileWidget> createState() => _PostProfileWidgetState();
}

class _PostProfileWidgetState extends State<PostProfileWidget> {
  late UserModel userModel;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userModel = context.read<AuthBloc>().state.currentAccount ?? UserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 28, bottom: 5, top: 3),
          child: Text(
            "Bài viết đã chia sẻ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.isLoadingScreen || state.isLoadingPosts) {
              return Skeletonizer(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
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
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.postModels.length,
              itemBuilder: (context, index) => PostWidget(
                postModel: state.postModels[index],
              ),
            );
          },
        )
      ],
    );
  }
}
