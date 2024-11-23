class ProfileEvent {}

class InitalLoadingProfile extends ProfileEvent {
  int accountId;
  InitalLoadingProfile({required this.accountId});
}

class InputFullName extends ProfileEvent {
  String updateName;
  InputFullName({required this.updateName});
}

class ChangeFullName extends ProfileEvent {
  int curentAccountId;  
  ChangeFullName(
    {required this.curentAccountId}
  );
}

class ChangeAvatarImage extends ProfileEvent {
  String avatarUrl;
  ChangeAvatarImage({required this.avatarUrl});
}

class ChangeBackgroundImage extends ProfileEvent {
  String backgroundImageUrl;
  ChangeBackgroundImage({required this.backgroundImageUrl});
}

class FetchAccountPosts extends ProfileEvent {
  FetchAccountPosts();
}

class RefreshAccountPosts extends ProfileEvent {
  RefreshAccountPosts();
}

class FetchAccountUser extends ProfileEvent {}

class FastUploadPost extends ProfileEvent {}

class InputDescriptionToUploadPost extends ProfileEvent {
  String description;
  InputDescriptionToUploadPost({required this.description});
}

class UpdateAccount extends ProfileEvent {}
