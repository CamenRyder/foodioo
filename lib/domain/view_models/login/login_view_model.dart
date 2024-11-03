class LoginViewModel {
  String username;
  String password;

  LoginViewModel({required this.username, required this.password});
}

class ResponseModel {
  bool getSuccess;
  String message;
  dynamic data;
  ResponseModel(
      {required this.data, required this.getSuccess, required this.message});
}
