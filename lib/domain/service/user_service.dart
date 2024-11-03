import 'package:dio/dio.dart';
import 'package:foodioo/domain/models/user_model.dart';
import 'package:foodioo/domain/view_models/register/register_view_model.dart';
import '../../core/helper/dio_sepecificate.dart';
import '../../core/helper/helper_function.dart';
import '../view_models/login/login_view_model.dart';

class UserService extends FetchClient {
  Future<List<UserModel>> getUser() async {
    try {
      List<UserModel> userModels = [];

      final Response<dynamic> result =
          await super.getData(path: '/accounts/me');
      if (result.data['code'] == 200) {
        final accounts = result.data['data'];

        for (var e in accounts) {
          userModels.add(UserModel.fromJson(e));
        }
      }
      return userModels;
    } catch (e) {
      return [];
    }
  }

  Future<ResponseModel> registerUser(RegisterViewModel data) async {
    try {
      Response<dynamic> result =  await super.postData(
          path: '/users/register' ,  
          params: data.toJson()
      );
    } catch (err) {}
  }

  Future<ResponseModel> loginUser(LoginViewModel data) async {
    try {
      String token = "";
      Response<dynamic> result = await super.postData(
          path: '/users/login',
          params: {'username': data.username, 'password': data.password});
      if (result.data['code'] == 200) {
        token = result.data['data']['access_token'];
        return ResponseModel(
            data: token, getSuccess: true, message: "Lấy token thành công");
      } else {
        return ResponseModel(
          data: null,
          getSuccess: false,
          message: showErorrResponse(result.data['code']),
        );
      }
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }
}
