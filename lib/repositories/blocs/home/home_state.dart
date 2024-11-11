import 'package:foodioo/repositories/models/post_model.dart';

class HomeState {
  List<PostModel> postModels;
  bool isLoadingNewFeed;
  bool isShowMessage = false;
  bool hasReachedPost = false;
  String message;

  HomeState(
      {this.postModels = const [],
      this.isLoadingNewFeed = false,
      this.isShowMessage = false,
      this.hasReachedPost = false,
      this.message = ""});

  HomeState copyWith({
    List<PostModel>? postModels,
    bool? isLoadingNewFeed,
    bool? isShowMessage,
    bool? hasReachedPost,
    String? message,
  }) {
    return HomeState(
        postModels: postModels ?? this.postModels,
        isLoadingNewFeed: isLoadingNewFeed ?? this.isLoadingNewFeed,
        isShowMessage: isShowMessage ?? false,
        message: message ?? this.message,
        hasReachedPost: hasReachedPost ?? this.hasReachedPost);
  }
}
