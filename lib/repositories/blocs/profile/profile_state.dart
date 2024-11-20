import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';

class ProfileState {
  int currentAccountId;
  UserModel userModel;
  List<PostModel> postModels;
  String message;
  bool isLoadingScreen;
  bool isLoadingPosts;
  bool isShowMessages;
  ProfileState({
    this.currentAccountId = 0,
    this.postModels = const [],
    required this.userModel,
    this.isLoadingPosts = false,
    this.isShowMessages = false,
    this.message = "",
    this.isLoadingScreen = false,
  });


  ProfileState copyWith(
      {int? currentAccountId,
      UserModel? userModel,
      List<PostModel>? postModels,
      bool? isShowMessages,
      bool? isLoadingPosts,
      bool? isLoadingScreen,
      String? message}) {
    return ProfileState(
        userModel: userModel ?? this.userModel,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        isShowMessages: isShowMessages ?? this.isShowMessages,
        isLoadingPosts: isLoadingPosts ?? this.isLoadingPosts,
        message: message ?? this.message,
        isLoadingScreen: isLoadingScreen ?? this.isLoadingScreen,
        postModels: postModels ?? this.postModels);
  }
}
