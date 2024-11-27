import 'package:foodioo/repositories/models/friend_status_model.dart';

class ProfileEvent {}

class InitalLoadingProfile extends ProfileEvent {
  int currentAccountId;
  int viaAccountId;
  InitalLoadingProfile(
      {required this.currentAccountId, required this.viaAccountId});
}

class InputFullName extends ProfileEvent {
  String updateName;
  InputFullName({required this.updateName});
}

class RefreshRelationshipFriend extends ProfileEvent {}

class ChangeFullName extends ProfileEvent {
  ChangeFullName();
}

class ChangeAvatarImage extends ProfileEvent {
  String avatarUrl;
  ChangeAvatarImage({required this.avatarUrl});
}

class PostChangeAvatarImage extends ProfileEvent {
  PostChangeAvatarImage();
}

class RemoveAvatarImage extends ProfileEvent {}

class ChangeBackgroundImage extends ProfileEvent {
  String backgroundImageUrl;
  ChangeBackgroundImage({required this.backgroundImageUrl});
}

class RemoveChangeBackgroundImage extends ProfileEvent {}

class PostChangeBackgroundImage extends ProfileEvent {
  PostChangeBackgroundImage();
}

class FetchAccountPosts extends ProfileEvent {
  FetchAccountPosts();
}

class RefreshAccountPosts extends ProfileEvent {
  RefreshAccountPosts();
}

class GetListFriends extends ProfileEvent {
  TypeFollwer type;
  GetListFriends({required this.type});
}

class RefreshListFriend extends ProfileEvent {
  TypeFollwer type;
  RefreshListFriend({required this.type});
}

class AcceptFollower extends ProfileEvent {
  int followerAccountId;
  AcceptFollower({required this.followerAccountId});
}

class DenyFollower extends ProfileEvent {
  int followerAccountId;
  DenyFollower({required this.followerAccountId});
}

class RemoveFriend extends ProfileEvent {
  int friendAccountId;
  RemoveFriend({required this.friendAccountId});
}

class FollowAccount extends ProfileEvent {
  int accountId;
  FollowAccount({required this.accountId});
}

class FetchAccountUser extends ProfileEvent {}

class FastUploadPost extends ProfileEvent {}

class InputDescriptionToUploadPost extends ProfileEvent {
  String description;
  InputDescriptionToUploadPost({required this.description});
}

class UpdateAccount extends ProfileEvent {}
