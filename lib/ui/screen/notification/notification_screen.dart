import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/blocs/notification/notifcation_event.dart';
import 'package:foodioo/repositories/blocs/notification/notifcation_state.dart';
import 'package:foodioo/repositories/blocs/notification/notification_bloc.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'widget/notification_component_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    final currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    context.read<NotificationBloc>().add(
        InitialLoadingNotifcationScreen(currentAccountId: currentAccountId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: Text(
              "Thông báo",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SpacingVerticalWidget(
            height: AppConstant.paddingComponent,
          ),

          Expanded(
            child: BlocBuilder<NotificationBloc, NotifcationState>(
            builder: (context, state) {
              if (state.isLoadingListNotification) {
                return Skeletonizer(
                    child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) =>
                      const NotificationComponentWidget(),
                ));
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NotificationBloc>().add(RefreshNotifications());
                },
                child: ListView.builder(
                  itemCount: state.notifcations.length,
                  itemBuilder: (context, index) {
                    return NotificationComponentWidget(
                      notificationModel: state.notifcations[index],
                    );
                  },
                ),
              );
            },
          ))
          // Expanded(child: ListView.builder(itemBuilder: ))
        ],
      ),
    ));
  }
}
