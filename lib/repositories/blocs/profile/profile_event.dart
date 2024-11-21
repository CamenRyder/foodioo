class ProfileEvent {}

class InitalLoadingProfile extends ProfileEvent {
  int accountId;
  InitalLoadingProfile({required this.accountId});
}

class FetchAccountPosts extends ProfileEvent {
  int page;  
  FetchAccountPosts({required this.page});
}

class FetchAccountUser extends ProfileEvent {}

class FastUploadPost extends ProfileEvent {}

class InputDescriptionToUploadPost extends ProfileEvent {
  String description;
  InputDescriptionToUploadPost({required this.description});
}

class UpdateAccount extends ProfileEvent {}
