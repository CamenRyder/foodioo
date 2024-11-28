import 'package:foodioo/repositories/models/notification_model.dart';

class NotifcationState {
  int currentAccountId;
  List<NotificationModel> notifcations;
  bool isLoadingListNotification;
  bool hasReachedNotifications;  
  int page;
  String message;
  bool isShowMessage;
  bool isSeenedNotification;

  NotifcationState(
      {this.currentAccountId = 0,
      this.notifcations = const [],
      this.isLoadingListNotification = false,
      this.hasReachedNotifications = false , 
      this.message = '',
      this.isShowMessage = false,
      this.isSeenedNotification = false,
      this.page = 1});

  NotifcationState copyWith({
    int? currentAccountId,
    List<NotificationModel>? notifcations,
    bool? isLoadingListNotification,
    String? message,
    bool? isShowMessage,
    bool? hasReachedNotifications, 
    bool? isSeenedNotification,
    int? page,
  }) {
    return NotifcationState(
      currentAccountId: currentAccountId ?? this.currentAccountId,
      message: message ?? this.message,
      hasReachedNotifications: hasReachedNotifications ?? this.hasReachedNotifications,
      isShowMessage: isShowMessage ?? this.isShowMessage,
      isSeenedNotification: isSeenedNotification ?? this.isSeenedNotification,
      notifcations: notifcations ?? this.notifcations,
      isLoadingListNotification:
          isLoadingListNotification ?? this.isLoadingListNotification,
      page: page ?? this.page,
    );
  }
}
