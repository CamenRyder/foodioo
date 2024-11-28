class HomeEvent {}

class InitalLoading extends HomeEvent {
  int currentAccountId;

  InitalLoading({required this.currentAccountId});
}

class FetchNewFeed extends HomeEvent {
  int page;
  FetchNewFeed({required this.page});
}

class RefreshNewFeed extends HomeEvent {
  RefreshNewFeed();
}

class FetchYourReport extends HomeEvent {
  int postId;
  FetchYourReport({required this.postId});
}

class MultiPickReport extends HomeEvent {
  List<int> issuesIds;
  int postId;
  MultiPickReport({required this.issuesIds, required this.postId});
}

class LikePost extends HomeEvent {
  final int postId;
  LikePost({required this.postId});
}

class UnLikePost extends HomeEvent {
  final int postId;
  UnLikePost({required this.postId});
}

class DeletePost extends HomeEvent {
  final int postId;
  DeletePost({required this.postId});
}

class GetAccountReactPost extends HomeEvent {
  final int postId;
  final int? page;
  GetAccountReactPost({required this.postId, this.page});
}
