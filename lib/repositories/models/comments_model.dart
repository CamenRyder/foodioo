class CommentModel {
  Account? account;
  int? accountId;
  String? description;
  String? createAt;
  int? id;
  Image? image;
  int? postTopId;
  int? postTypeId;

  CommentModel(
      {this.account,
      this.accountId,
      this.description,
      this.id,
      this.image,
      this.postTopId,
      this.postTypeId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    accountId = json['account_id'];
    description = json['description'];
    id = json['id'];
    createAt = json['created_at'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    postTopId = json['post_top_id'];
    postTypeId = json['post_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['account_id'] = accountId;
    data['description'] = description;
    data['create_at'] = createAt;
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['post_top_id'] = postTopId;
    data['post_type_id'] = postTypeId;
    return data;
  }
}

class Account {
  String? fullname;
  int? id;
  int? roleId;
  String? urlAvatar;
  String? urlBackgroundProfile;
  int? userId;

  Account(
      {this.fullname,
      this.id,
      this.roleId,
      this.urlAvatar,
      this.urlBackgroundProfile,
      this.userId});

  Account.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    id = json['id'];
    roleId = json['role_id'];
    urlAvatar = json['url_avatar'];
    urlBackgroundProfile = json['url_background_profile'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['id'] = id;
    data['role_id'] = roleId;
    data['url_avatar'] = urlAvatar;
    data['url_background_profile'] = urlBackgroundProfile;
    data['user_id'] = userId;
    return data;
  }
}

class Image {
  int? id;
  int? postId;
  String? urlImage;

  Image({this.id, this.postId, this.urlImage});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    urlImage = json['url_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['url_image'] = urlImage;
    return data;
  }
}
