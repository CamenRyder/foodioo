class ProfileEvent {}

class InitalLoadingProfile extends ProfileEvent {
  int accountId; 
  InitalLoadingProfile({required this.accountId});
}

class FetchAccountPosts extends ProfileEvent {}

class FetchAccountUser extends ProfileEvent {}

class UpdateAccount extends ProfileEvent {}
