import 'package:foodioo/repositories/models/friend_status_model.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';

class ProfileState {
  int currentAccountId;
  int viaAccountId;
  String description;
  UserModel userModel;
  int totalFollower;
  int pageFriend;
  int pageRequested;
  int pageFollwer;
  bool hasReachedListRequested;
  bool hasReachedListAccept;
  bool hasReachedListFriend;
  bool isLoadingListRequested;
  bool isLoadingListAccept;
  bool isLoadingListFriend;
  TypeFollwer typeFollwerCurrentAccountWithViaAccount;
  List<UserModel> followerList;
  int totalFriend;
  List<UserModel> friendList;
  int totalRequested;
  List<UserModel> requestedList;
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
    this.pageFollwer = 1,
    this.hasReachedListRequested = false,
    this.hasReachedListAccept = false,
    this.hasReachedListFriend = false,
    this.isLoadingListRequested = false,
    this.isLoadingListAccept = false,
    this.isLoadingListFriend = false,
    this.pageFriend = 1,
    this.pageRequested = 1,
    this.typeFollwerCurrentAccountWithViaAccount = TypeFollwer.stranger,
    this.totalFollower = 0,
    this.totalFriend = 0,
    this.followerList = const [],
    this.friendList = const [],
    this.requestedList = const [],
    this.totalRequested = 0,
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
      int? totalFollower,
      List<UserModel>? followerList,
      bool? isLoadingListRequested,
      bool? isLoadingListAccept,
      bool? isLoadingListFriend,
      int? totalFriend,
      int? pageFriend,
      int? pageRequested,
      int? pageFollwer,
      TypeFollwer? typeFollwerCurrentAccountWithViaAccount,
      List<UserModel>? friendList,
      int? totalRequested,
      List<UserModel>? requestedList,
      bool? isShowMessages,
      bool? isLoadingPosts,
      bool? isLoadingScreen,
      bool? isLoadingUpdate,
      bool? isUpdateSuccess,
      bool? hasReachedListRequested,
      bool? hasReachedListAccept,
      bool? hasReachedListFriend,
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
        pageFollwer: pageFollwer ?? this.pageFollwer,
        pageFriend: pageFriend ?? this.pageFriend,
        pageRequested: pageRequested ?? this.pageRequested,
        isLoadingListAccept: isLoadingListAccept ?? this.isLoadingListAccept,
        isLoadingListFriend: isLoadingListFriend ?? this.isLoadingListFriend,
        isLoadingListRequested: isLoadingListRequested ?? this.isLoadingListRequested,
        typeFollwerCurrentAccountWithViaAccount:
            typeFollwerCurrentAccountWithViaAccount ??
                this.typeFollwerCurrentAccountWithViaAccount,
        hasReachedListRequested:
            hasReachedListRequested ?? this.hasReachedListRequested,
        hasReachedListAccept: hasReachedListAccept ?? this.hasReachedListAccept,
        hasReachedListFriend: hasReachedListFriend ?? this.hasReachedListFriend,
        isLoadingUpdate: isLoadingUpdate ?? this.isLoadingUpdate,
        isHasReachedPost: isHasReachedPost ?? this.isHasReachedPost,
        isLoadingPosts: isLoadingPosts ?? this.isLoadingPosts,
        description: description ?? this.description,
        isLoadingOverLay: isLoadingOverLay ?? this.isLoadingOverLay,
        message: message ?? '',
        isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
        isLoadingScreen: isLoadingScreen ?? this.isLoadingScreen,
        totalFollower: totalFollower ?? this.totalFollower,
        followerList: followerList ?? this.followerList,
        totalFriend: totalFriend ?? this.totalFriend,
        friendList: friendList ?? this.friendList,
        totalRequested: totalRequested ?? this.totalRequested,
        requestedList: requestedList ?? this.requestedList,
        postModels: postModels ?? this.postModels);
  }
}
