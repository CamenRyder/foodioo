class HomeEvent {}

class InitalLoading extends HomeEvent {}

class FetchNewFeed extends HomeEvent {
  int page;  
  FetchNewFeed({required this.page});
}

class ReactPost extends HomeEvent {
  int id;
  ReactPost({required this.id});
}


