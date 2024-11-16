class CommentEvent {}

class InitialLoaingComments extends CommentEvent {
  int postId;
  int currentPostId;

  InitialLoaingComments({required this.currentPostId, required this.postId});
}

class FetchedComments extends CommentEvent {
  int page;

  FetchedComments({required this.page});
}

class InputDescription extends CommentEvent {
  String description;

  InputDescription({required this.description});
}

class PostComments extends CommentEvent {}
