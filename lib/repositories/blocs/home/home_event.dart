class HomeEvent {}

class InitalLoading extends HomeEvent {
  int currentAccountId;

  InitalLoading({required this.currentAccountId});
}

class FetchNewFeed extends HomeEvent {
  int page;
  FetchNewFeed({required this.page});
}

class LikePost extends HomeEvent {
  final int postId;
  LikePost({required this.postId});
}

class DislikePost extends HomeEvent {
  final int postId;
  DislikePost({required this.postId});
}
