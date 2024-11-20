import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';

class ProfileState {
  int currentAccountId;
  UserModel userModel;
  List<PostModel> postModels;
  String message;
  bool isShowMessages;
  ProfileState({
    this.currentAccountId = 0,
    this.postModels = const [],
    required this.userModel,
    this.isShowMessages = false,
    this.message = "",
  });

  ProfileState copyWith(
      {int? currentAccountId,
      UserModel? userModel,
      List<PostModel>? postModels,
      bool? isShowMessages,
      String? message}) {
    return ProfileState(
        userModel: userModel ?? this.userModel,
        currentAccountId: currentAccountId ?? this.currentAccountId,
        isShowMessages: isShowMessages ?? this.isShowMessages,
        message: message ?? this.message,
        postModels: postModels ?? this.postModels);
  }
}
