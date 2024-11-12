import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/react_model.dart';

class HomeState {
  List<PostModel> postModels;
  List<ReactModel> reactModels;
  int currentAccountId;
  bool isLoadingNewFeed;
  bool isLoadingAccountsReact;
  bool isShowMessage = false;
  bool hasReachedPost = false;
  bool hasReachedReactPost = false;
  String message;

  HomeState(
      {this.postModels = const [],
      this.reactModels = const [],
      this.isLoadingAccountsReact = false,
      this.isLoadingNewFeed = false,
      this.isShowMessage = false,
      this.hasReachedReactPost = false,
      this.currentAccountId = 0,
      this.hasReachedPost = false,
      this.message = ""});

  HomeState copyWith({
    List<PostModel>? postModels,
    List<ReactModel>? reactModels,
    bool? isLoadingNewFeed,
    bool? isLoadingAccountsReact,
    bool? isShowMessage,
    bool? hasReachedPost,
    bool? hasReachedReactPost,
    int? currentAccountId,
    String? message,
  }) {
    return HomeState(
        postModels: postModels ?? this.postModels,
        reactModels: reactModels ?? this.reactModels, 
        isLoadingNewFeed: isLoadingNewFeed ?? this.isLoadingNewFeed,
        isShowMessage: isShowMessage ?? false,
        hasReachedReactPost: hasReachedReactPost ?? this.hasReachedReactPost,
        isLoadingAccountsReact:
            isLoadingAccountsReact ?? this.isLoadingAccountsReact,
        message: message ?? this.message,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        hasReachedPost: hasReachedPost ?? this.hasReachedPost);
  }
}
