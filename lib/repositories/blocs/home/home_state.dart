import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/react_model.dart';

import '../../models/report_model.dart';

class HomeState {
  List<PostModel> postModels;
  List<ReactModel> reactModels;
  List<ReportModel> issuesDefault;
  List<ReportModel> issuesTicked;

  int currentAccountId;
  bool isLoadingNewFeed;
  bool isLoadingAccountsReact;
  bool isLoadingDeletePost;
  bool isShowMessage = false;
  bool isRefreshFeed = false;
  bool hasReachedPost = false;
  bool hasReachedReactPost = false;
  String message;

  HomeState(
      {this.postModels = const [],
      this.reactModels = const [],
      this.issuesDefault = const [],
      this.issuesTicked = const [],
      this.isLoadingAccountsReact = false,
      this.isLoadingNewFeed = false,
      this.isShowMessage = false,
      this.isLoadingDeletePost = false,
      this.hasReachedReactPost = false,
      this.isRefreshFeed = false,
      this.currentAccountId = 0,
      this.hasReachedPost = false,
      this.message = ""});

  HomeState copyWith({
    List<PostModel>? postModels,
    List<ReactModel>? reactModels,
    List<ReportModel>? issuesDefault,
    List<ReportModel>? issuesTicked,
    bool? isLoadingNewFeed,
    bool? isLoadingAccountsReact,
    bool? isLoadingDeletePost,
    bool? isShowMessage,
    bool? isRefreshFeed,
    bool? hasReachedPost,
    bool? hasReachedReactPost,
    int? currentAccountId,
    String? message,
  }) {
    return HomeState(
        issuesDefault: issuesDefault ?? this.issuesDefault,
        issuesTicked: issuesTicked ?? this.issuesTicked,
        postModels: postModels ?? this.postModels,
        reactModels: reactModels ?? this.reactModels,
        isLoadingNewFeed: isLoadingNewFeed ?? this.isLoadingNewFeed,
        isShowMessage: isShowMessage ?? false,
        hasReachedReactPost: hasReachedReactPost ?? this.hasReachedReactPost,
        isLoadingDeletePost: isLoadingDeletePost ?? this.isLoadingDeletePost,
        isRefreshFeed: isRefreshFeed ?? false,
        isLoadingAccountsReact:
            isLoadingAccountsReact ?? this.isLoadingAccountsReact,
        message: message ?? this.message,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        hasReachedPost: hasReachedPost ?? this.hasReachedPost);
  }
}
