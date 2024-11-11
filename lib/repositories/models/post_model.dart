class PostModel {
  int? id;
  int? postTypeId;
  int? accountId;
  String? description;
  double? lng;
  double? lat;
  String? createdAt;
  List<Images>? images;
  List<int>? accountLikes;
  Account? account;
  int? totalLike;
  int? totalComment;

  PostModel(
      {this.id,
      this.postTypeId,
      this.accountId,
      this.description,
      this.lng,
      this.lat,
      this.createdAt,
      this.images,
      this.account,
      this.accountLikes,
      this.totalLike,
      this.totalComment});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postTypeId = json['post_type_id'];
    accountId = json['account_id'];
    description = json['description'];
    accountLikes = json['list_account_id_react'].cast<int>();
    lng = json['lng'];
    lat = json['lat'];
    createdAt = json['created_at'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    totalLike = json['total_like'];
    totalComment = json['total_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_type_id'] = postTypeId;
    data['account_id'] = accountId;
    data['description'] = description;
    data['lng'] = lng;
    data['lat'] = lat;
    data['created_at'] = createdAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['total_like'] = totalLike;
    data['total_comment'] = totalComment;
    return data;
  }
}

class Images {
  int? id;
  String? urlImage;
  int? postId;

  Images({this.id, this.urlImage, this.postId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['url_image'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url_image'] = urlImage;
    data['post_id'] = postId;
    return data;
  }
}

class Account {
  int? id;
  int? userId;
  String? fullname;
  String? urlAvatar;
  String? urlBackgroundProfile;
  int? roleId;

  Account(
      {this.id,
      this.userId,
      this.fullname,
      this.urlAvatar,
      this.urlBackgroundProfile,
      this.roleId});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fullname = json['fullname'];
    urlAvatar = json['url_avatar'];
    urlBackgroundProfile = json['url_background_profile'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['url_avatar'] = urlAvatar;
    data['url_background_profile'] = urlBackgroundProfile;
    data['role_id'] = roleId;
    return data;
  }
}
