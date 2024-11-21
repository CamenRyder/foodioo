import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';

class ProfileState {
  int currentAccountId;
  String description;
  UserModel userModel;
  List<PostModel> postModels;
  String message;
  bool isLoadingScreen;
  bool isLoadingPosts;
  bool isLoadingOverLay;
  bool isShowMessages;
  ProfileState({
    this.currentAccountId = 0,
    this.postModels = const [],
    required this.userModel,
    this.isLoadingPosts = false,
    this.isLoadingOverLay = false,
    this.isShowMessages = false,
    this.description = "",
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
      bool? isLoadingOverLay,
      String? description,
      String? message}) {
    return ProfileState(
        userModel: userModel ?? this.userModel,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        isShowMessages: isShowMessages ?? this.isShowMessages,
        isLoadingPosts: isLoadingPosts ?? this.isLoadingPosts,
        description: description ?? this.description,
        isLoadingOverLay: isLoadingOverLay ?? this.isLoadingOverLay,
        message: message ?? this.message,
        isLoadingScreen: isLoadingScreen ?? this.isLoadingScreen,
        postModels: postModels ?? this.postModels);
  }
}
