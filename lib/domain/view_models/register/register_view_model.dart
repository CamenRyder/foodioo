class RegisterViewModel {
  String? email;
  String? fullname;
  int? gender;
  String? password;
  String? username;

  RegisterViewModel(
      {this.email, this.fullname, this.gender, this.password, this.username});

  RegisterViewModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullname = json['fullname'];
    gender = json['gender'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['gender'] = "${this.gender}";
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}
