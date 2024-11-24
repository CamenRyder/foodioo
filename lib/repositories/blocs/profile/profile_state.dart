import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';

class ProfileState {
  int currentAccountId;
  int viaAccountId;
  String description;
  UserModel userModel;
  List<PostModel> postModels;
  String dynamicUpdateField; // use update fullname , bg , avatar
  String message;
  int page;
  bool isUpdateSuccess;
  bool isLoadingScreen;
  bool isLoadingUpdate;
  bool isHasReachedPost;
  bool isLoadingPosts;
  bool isLoadingOverLay;
  bool isShowMessages;
  ProfileState({
    this.currentAccountId = 0,
    this.postModels = const [],
    this.page = 1,
    this.viaAccountId = 0,
    this.isUpdateSuccess = false,
    this.isLoadingUpdate = false,
    required this.userModel,
    this.isLoadingPosts = false,
    this.dynamicUpdateField = "",
    this.isLoadingOverLay = false,
    this.isShowMessages = false,
    this.isHasReachedPost = false,
    this.description = "",
    this.message = "",
    this.isLoadingScreen = false,
  });

  ProfileState copyWith(
      {int? currentAccountId,
      int? viaAccountId,
      UserModel? userModel,
      List<PostModel>? postModels,
      bool? isShowMessages,
      bool? isLoadingPosts,
      bool? isLoadingScreen,
      bool? isLoadingUpdate,
      bool? isUpdateSuccess,
      String? dynamicUpdateField,
      int? page,
      bool? isHasReachedPost,
      bool? isLoadingOverLay,
      String? description,
      String? message}) {
    return ProfileState(
        userModel: userModel ?? this.userModel,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        isShowMessages: isShowMessages ?? false,
        viaAccountId: viaAccountId ?? this.viaAccountId,
        dynamicUpdateField: dynamicUpdateField ?? this.dynamicUpdateField,
        page: page ?? this.page,
        isLoadingUpdate: isLoadingUpdate ?? this.isLoadingUpdate,
        isHasReachedPost: isHasReachedPost ?? this.isHasReachedPost,
        isLoadingPosts: isLoadingPosts ?? this.isLoadingPosts,
        description: description ?? this.description,
        isLoadingOverLay: isLoadingOverLay ?? this.isLoadingOverLay,
        message: message ?? '',
        isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
        isLoadingScreen: isLoadingScreen ?? this.isLoadingScreen,
        postModels: postModels ?? this.postModels);
  }
}
