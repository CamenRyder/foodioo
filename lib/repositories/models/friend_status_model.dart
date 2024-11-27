enum TypeFollwer { accept, request, friend, stranger }

class FriendStatusModel {
  TypeFollwer typeFollower;
  String nameFollower;

  FriendStatusModel({required this.typeFollower, required this.nameFollower});

  static FriendStatusModel equalType(TypeFollwer type) {
    if (type == TypeFollwer.accept) {
      return FriendStatusModel(
          typeFollower: TypeFollwer.accept, nameFollower: "accept");
    } else if (type == TypeFollwer.request) {
      return FriendStatusModel(
          typeFollower: TypeFollwer.request, nameFollower: "request");
    } else if (type == TypeFollwer.friend) {
      return FriendStatusModel(
          typeFollower: TypeFollwer.friend, nameFollower: "friend");
    } else {
      return FriendStatusModel(
          typeFollower: TypeFollwer.stranger, nameFollower: "stranger");
    }
  }

  static FriendStatusModel equalString(String type) {
    if (type == "accept") {
      return FriendStatusModel(
          typeFollower: TypeFollwer.accept, nameFollower: "accept");
    } else if (type == "request") {
      return FriendStatusModel(
          typeFollower: TypeFollwer.request, nameFollower: "request");
    } else if (type == "friend") {
      return FriendStatusModel(
          typeFollower: TypeFollwer.friend, nameFollower: "friend");
    } else {
      return FriendStatusModel(
          typeFollower: TypeFollwer.stranger, nameFollower: "stranger");
    }
  }
}
