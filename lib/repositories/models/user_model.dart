class UserModel {
  String? address;
  String? country;
  String? fullname;
  int? gender;
  int? id; // account
  bool? isUpgrade;
  String? language;
  double? lat;
  double? lng;
  String? urlAvatar;
  String? urlBackgroundProfile;
  int? userId; // root
  UserModel(
      {this.address,
      this.country,
      this.fullname,
      this.gender,
      this.id,
      this.isUpgrade,
      this.language,
      this.lat,
      this.lng,
      this.urlAvatar,
      this.urlBackgroundProfile,
      this.userId});

  UserModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    country = json['country'];
    fullname = json['fullname'];
    gender = json['gender'];
    id = json['id'];
    isUpgrade = json['is_upgrade'];
    language = json['language'];
    lat = json['lat'];
    lng = json['lng'];
    urlAvatar = json['url_avatar'];
    urlBackgroundProfile = json['url_background_profile'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['country'] = this.country;
    data['fullname'] = this.fullname;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['is_upgrade'] = this.isUpgrade;
    data['language'] = this.language;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['url_avatar'] = this.urlAvatar;
    data['url_background_profile'] = this.urlBackgroundProfile;
    data['user_id'] = this.userId;
    return data;
  }
}
