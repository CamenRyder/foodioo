import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../repositories/blocs/profile/profile_event.dart';
import 'widget/scroll_view_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.viaAccountId});
  final int viaAccountId;
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
              ..add(InitalLoadingProfile(
                  viaAccountId: widget.viaAccountId,
                  currentAccountId: currentAccountId)),
            child: BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (previous, current) =>
                    previous.isLoadingOverLay != current.isLoadingOverLay ||
                    previous.isShowMessages != current.isShowMessages,
                builder: (context, state) {
                  if (state.isLoadingOverLay) {
                    context.loaderOverlay.show();
                  } else {
                    context.loaderOverlay.hide();
                  }
                  if (state.isShowMessages) {
                    MessageToast.showToast(context, message: state.message);
                  }
                  return SafeArea(
                    child: RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<ProfileBloc>()
                              .add(RefreshAccountPosts());
                        },
                        child: const ScrollViewWidgets()),
                  );
                })));
  }
}
