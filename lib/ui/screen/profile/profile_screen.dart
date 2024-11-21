import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../repositories/blocs/profile/profile_event.dart';
import 'widget/button_edit_widget.dart';
import 'widget/header_profile_widget.dart';
import 'widget/post_profile_widget.dart';
import 'widget/quick_upload_post_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentAccountId = 0;
  @override
  void initState() {
    super.initState();
    currentAccountId = context.read<AuthBloc>().state.currentAccount?.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => ProfileBloc()
              ..add(InitalLoadingProfile(accountId: currentAccountId)),
            child: SafeArea(
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                        if (state.isLoadingScreen) {
                          return const Skeletonizer(
                              child: HeaderProfileWidget());
                        }
                        return HeaderProfileWidget(
                          userModel: state.userModel,
                        );
                      }),
                      const SpacingVerticalWidget(height: 12),
                      const ButtonEditWidget(),
                      const QuickUploadPost(),
                      const PostProfileWidget(),
                    ],
                  )),
            )));
  }
}
