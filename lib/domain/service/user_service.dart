import 'package:dio/dio.dart';
import 'package:foodioo/domain/models/user_model.dart';

import '../../Core/Helper/dio_sepecificate.dart';

class UserService extends FetchClient {
  Future<UserModel> getUser() async {
    try {
      Response<dynamic> result = await getData(domainApp: 'http://foodioo.camenryder.xyz/api', path: '/accounts/me');
      return UserModel.fromJson(result.data);
    } catch (e) {
      return UserModel();
    }
  }
}
