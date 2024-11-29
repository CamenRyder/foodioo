import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/notification/notifcation_event.dart';
import 'package:foodioo/repositories/blocs/notification/notifcation_state.dart';
import 'package:foodioo/repositories/service/notifcation_service.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

import '../../models/notification_model.dart';

class NotificationBloc extends Bloc<NotifcationEvent, NotifcationState> {
  NotificationBloc() : super(NotifcationState()) {
    on<InitialLoadingNotifcationScreen>(_onInitialLoadingNotifcationScreen);
    on<RefreshNotifications>(_onRefreshNotifications);
    on<FetchNotifications>(_onFetchNotifications);
    on<SeenNotification>(_onSeenNotification);
    on<SeenAllNotification>(_onSeenAllNotification);
  }

  NotifcationService notifcationService = NotifcationService();
  int pageSize = AppConstant.pageSize;

  _onInitialLoadingNotifcationScreen(InitialLoadingNotifcationScreen event,
      Emitter<NotifcationState> emit) async {
    emit(state.copyWith(isLoadingListNotification: true));
    ResponseModel responseModel = await notifcationService.getYourNotification(
        page: 1, pageSize: pageSize, accountId: event.currentAccountId);
    if (responseModel.getSuccess) {
      emit(state.copyWith(
          notifcations: responseModel.data,
          page: 2,
          currentAccountId: event.currentAccountId,
          isSeenedNotification: false,
          isLoadingListNotification: false));
    }
  }

  _onSeenNotification(SeenNotification event, Emitter emit) async {
    ResponseModel responseModel = await notifcationService.seenNotification(
        notifcationId: event.notifcationId);
    if (responseModel.getSuccess) {
      emit(state.copyWith(isSeenedNotification: true));
      add(RefreshNotifications());
    }
  }

  _onSeenAllNotification(SeenAllNotification event, Emitter emit) async {
    ResponseModel responseModel = await notifcationService.seenAllNotification(
        accountId: state.currentAccountId);
    if (responseModel.getSuccess) {
      emit(state.copyWith(isSeenedNotification: true));
      add(RefreshNotifications());
    }
  }

  _onRefreshNotifications(RefreshNotifications event, Emitter emit) {
    emit(state.copyWith(
        page: 1,
        isSeenedNotification: false,
        hasReachedNotifications: false,
        notifcations: []));
    add(FetchNotifications());
  }

  _onFetchNotifications(
      FetchNotifications event, Emitter<NotifcationState> emit) async {
    if (!state.hasReachedNotifications) {
      if (state.page == 1) {
        emit(state.copyWith(isLoadingListNotification: true));
      }
      int page = state.page;
      ResponseModel responseModel =
          await notifcationService.getYourNotification(
              page: page,
              pageSize: pageSize,
              accountId: state.currentAccountId);
      List<NotificationModel> currentNotifications = state.notifcations;
      currentNotifications.addAll(responseModel.data);
      if (responseModel.getSuccess) {
        emit(state.copyWith(
            notifcations: currentNotifications,
            page: ++page,
            hasReachedNotifications: responseModel.data.isEmpty,
            isLoadingListNotification: false));
      }
    }
  }
}
