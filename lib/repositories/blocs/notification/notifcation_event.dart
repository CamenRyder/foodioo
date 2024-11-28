class NotifcationEvent {}

class InitialLoadingNotifcationScreen extends NotifcationEvent {
  int currentAccountId;  
  InitialLoadingNotifcationScreen({required this.currentAccountId});
}

class RefreshNotifications
    extends NotifcationEvent {} // update bien hien thi support

class FetchNotifications extends NotifcationEvent {}

class SeenAllNotification extends NotifcationEvent {}

class SeenNotification extends NotifcationEvent {
  final int notifcationId;
  SeenNotification({required this.notifcationId});
}
