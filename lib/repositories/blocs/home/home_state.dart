import 'package:foodioo/repositories/models/post_model.dart';

class HomeState {
  List<PostModel> postModels;
  int currentAccountId;
  bool isLoadingNewFeed;
  bool isShowMessage = false;
  bool hasReachedPost = false;
  String message;

  HomeState(
      {this.postModels = const [],
      this.isLoadingNewFeed = false,
      this.isShowMessage = false,
      this.currentAccountId = 0,
      this.hasReachedPost = false,
      this.message = ""});

  HomeState copyWith({
    List<PostModel>? postModels,
    bool? isLoadingNewFeed,
    bool? isShowMessage,
    bool? hasReachedPost,
    int? currentAccountId,
    String? message,
  }) {
    return HomeState(
        postModels: postModels ?? this.postModels,
        isLoadingNewFeed: isLoadingNewFeed ?? this.isLoadingNewFeed,
        isShowMessage: isShowMessage ?? false,
        message: message ?? this.message,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        hasReachedPost: hasReachedPost ?? this.hasReachedPost);
  }
}
