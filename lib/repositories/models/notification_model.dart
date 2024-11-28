class NotificationModel {
  int? accountId;
  String? createdAt;
  int? id;
  int? invoiceId;
  bool? isSeen;
  String? message;
  int? postId;
  int? typeId;
  UserAction? userAction;

  NotificationModel(
      {this.accountId,
      this.createdAt,
      this.id,
      this.invoiceId,
      this.isSeen,
      this.message,
      this.postId,
      this.typeId,
      this.userAction});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    createdAt = json['created_at'];
    id = json['id'];
    invoiceId = json['invoice_id'];
    isSeen = json['is_seen'];
    message = json['message'];
    postId = json['post_id'];
    typeId = json['type_id'];
    userAction = json['user_action'] != null
        ? UserAction.fromJson(json['user_action'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['invoice_id'] = invoiceId;
    data['is_seen'] = isSeen;
    data['message'] = message;
    data['post_id'] = postId;
    data['type_id'] = typeId;
    if (userAction != null) {
      data['user_action'] = userAction!.toJson();
    }
    return data;
  }
}

class UserAction {
  String? fullname;
  int? id;
  int? roleId;
  String? urlAvatar;
  String? urlBackgroundProfile;
  int? userId;

  UserAction(
      {this.fullname,
      this.id,
      this.roleId,
      this.urlAvatar,
      this.urlBackgroundProfile,
      this.userId});

  UserAction.fromJson(Map<String, dynamic> json) {
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
