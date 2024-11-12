class ReactModel {
  Account? account;
  int? id;
  int? postId;
  int? state;

  ReactModel({this.account, this.id, this.postId, this.state});

  ReactModel.fromJson(Map<String, dynamic> json) {
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    id = json['id'];
    postId = json['post_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['id'] = id;
    data['post_id'] = postId;
    data['state'] = state;
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
