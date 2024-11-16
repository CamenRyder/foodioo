import 'package:foodioo/repositories/models/comments_model.dart';

class CommentState {
  bool isLoading;
  bool isShowMessage;
  String message;
  List<CommentModel> commentModels;
  int postId;
  int currentAccountId;
  bool isPosting;
  bool isHasReachedCommnent;
  bool isEnableCommentPost;
  String description;

  CommentState({
    this.isLoading = false,
    this.isShowMessage = false,
    this.message = '',
    this.description = '',
    this.isHasReachedCommnent = false,
    this.commentModels = const [],
    this.isEnableCommentPost = false,
    this.postId = 0,
    this.currentAccountId = 0,
    this.isPosting = false,
  });

  CommentState copyWith({
    bool? isLoading,
    bool? isShowMessage,
    bool? isEnableCommentPost,
    bool? isHasReachedCommnent,
    String? description,
    String? message,
    List<CommentModel>? commentModels,
    int? postId,
    int? currentAccountId,
    bool? isPosting,
  }) {
    return CommentState(
      isLoading: isLoading ?? this.isLoading,
      isShowMessage: isShowMessage ?? false,
      message: message ?? '',
      isHasReachedCommnent: isHasReachedCommnent ?? this.isHasReachedCommnent,
      isEnableCommentPost: isEnableCommentPost ?? this.isEnableCommentPost,
      commentModels: commentModels ?? this.commentModels,
      description: description ?? this.description,
      postId: postId ?? this.postId,
      currentAccountId: currentAccountId ?? this.currentAccountId,
      isPosting: isPosting ?? this.isPosting,
    );
  }
}
