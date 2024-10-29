import 'package:dio/dio.dart';
import 'package:foodioo/domain/models/user_model.dart';

import '../../Core/Helper/dio_sepecificate.dart';

class UserService extends FetchClient {
  Future<List<UserModel>> getUser() async {
    try {
      List<UserModel> userModels = [];
      Response<dynamic> result = await getData(path: '/accounts/me');
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
}
