import 'package:dio/dio.dart';

import '../../Core/Helper/dio_sepecificate.dart';
import '../../Core/Helper/validate_code_response.dart';
import '../models/user_model.dart';
import '../view/login_vm.dart';
import '../view/register_vm.dart';

class UserService extends FetchClient {
  Future<ResponseModel> getUser() async {
    try {
      List<UserModel> userModels = [];

      final Response<dynamic> result =
          await super.getData(path: '/accounts/me');
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final accounts = result.data['data'];

        for (var e in accounts) {
          userModels.add(UserModel.fromJson(e));
        }
        return ResponseModel(
            data: result,
            getSuccess: true,
            message: "Lấy thông tin thành công");
      }
      return ResponseModel(
          data: null,
          getSuccess: false,
          message: ValidateCodeResponse.showErorrResponse(result.data['code']));
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }

  Future<ResponseModel> registerUser(RegisterViewModel data) async {
    try {
      Response<dynamic> result =
          await super.postData(path: '/users/register', params: {
        'username': data.username,
        'password': data.password,
        'email': data.email,
        'fullname': data.fullname,
        'gender': data.gender
      });
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: null,
            getSuccess: true,
            message: "Đăng ký tài khoản thành công");
      } else {
        return ResponseModel(
            data: null,
            getSuccess: false,
            message:
                ValidateCodeResponse.showErorrResponse(result.data['code']));
      }
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
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
          message: ValidateCodeResponse.showErorrResponse(result.data['code']),
        );
      }
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }
}
