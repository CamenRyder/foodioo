class PostModel {
  Account? account;
  int? accountId;
  String? createdAt;
  String? description;
  int? id;
  List<Images>? images;
  double? lat;
  double? lng;
  num? postTypeId;
  ReactState? reactState;
  int? totalComment;
  int? totalLike;

  PostModel(
      {this.account,
      this.accountId,
      this.createdAt,
      this.description,
      this.id,
      this.images,
      this.lat,
      this.lng,
      this.postTypeId,
      this.reactState,
      this.totalComment,
      this.totalLike});

  PostModel.fromJson(Map<String, dynamic> json) {
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    accountId = json['account_id'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    lat = json['lat'];
    lng = json['lng'];
    postTypeId = json['post_type_id'];
    reactState = json['react_state'] != null
        ? ReactState.fromJson(json['react_state'])
        : null;
    totalComment = json['total_comment'];
    totalLike = json['total_like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['account_id'] = accountId;
    data['created_at'] = createdAt;
    data['description'].description;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['lat'] = lat;
    data['lng'] = lng;
    data['post_type_id'] = postTypeId;
    if (reactState != null) {
      data['react_state'] = reactState!.toJson();
    }
    data['total_comment'] = totalComment;
    data['total_like'] = totalLike;
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

class Images {
  int? id;
  int? postId;
  String? urlImage;

  Images({this.id, this.postId, this.urlImage});

  Images.fromJson(Map<String, dynamic> json) {
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

class ReactState {
  int? accountId;
  int? postId;
  int? state;

  ReactState({this.accountId, this.postId, this.state});

  ReactState.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    postId = json['post_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['post_id'] = postId;
    data['state'] = state;
    return data;
  }
}
