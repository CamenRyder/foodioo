import 'package:dio/dio.dart';

import '../../Core/Helper/dio_sepecificate.dart';
import '../../Core/Helper/validate_code_response.dart';
import '../models/friend_status_model.dart';
import '../models/user_model.dart';
import '../view/login_vm.dart';
import '../view/register_vm.dart';

class UserService extends FetchClient {
  Future<ResponseModel> getUserById({required int accountId}) async {
    try {
      UserModel userModel = UserModel();

      final Response<dynamic> result =
          await super.getData(path: '/accounts/$accountId');
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final accounts = result.data['data'];
        userModel = UserModel.fromJson(accounts);
        // for (var e in accounts) {
        //   userModels.add();
        // }
        return ResponseModel(
            data: userModel,
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

  Future<ResponseModel> updateAvatar(
      {required int accountId, required String urlImage}) async {
    try {
      final Response<dynamic> result = await super.updateImage(
          url: 'http://foodioo.camenryder.xyz/api/accounts/avatar',
          mapDataForm: {
            'account_id': accountId,
            'image': [await MultipartFile.fromFile(urlImage)]
          });
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data['data'],
            getSuccess: true,
            message: "Cập nhập hình đại diện thành công");
      } else {
        return ResponseModel(
            getSuccess: false,
            message: "Cập nhật hình đại diện thất bại",
            data: null);
      }
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }

  Future<ResponseModel> updateBackground(
      {required int accountId, required String urlImage}) async {
    try {
      final Response<dynamic> result = await super.updateImage(
          url: 'http://foodioo.camenryder.xyz/api/accounts/background',
          mapDataForm: {
            'account_id': accountId,
            'image': [await MultipartFile.fromFile(urlImage)]
          });
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data['data'],
            getSuccess: true,
            message: "Cập nhập hình nền thành công");
      } else {
        return ResponseModel(
            getSuccess: false,
            message: "Cập nhật hình nền thất bại",
            data: null);
      }
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }

  Future<ResponseModel> updateFullName(
      {required int accountId, required String fullName}) async {
    try {
      final Response<dynamic> result = await super.putData(
          path: '/accounts/fullname/$accountId',
          params: {"fullname": fullName});
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final accounts = result.data['data'];
        UserModel userModel = UserModel();
        userModel = UserModel.fromJson(accounts);
        return ResponseModel(
            data: userModel,
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
            data: userModels,
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

  Future<ResponseModel> refeshToken(String refeshToken) async {
    try {
      final Response<dynamic> result = await super.postData(
          path: '/users/refesh', params: {'refesh_token': refeshToken});

      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final token = result.data['data']['access_token'];
        return ResponseModel(
            data: token, getSuccess: true, message: "Lấy token thành công");
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
      String refeshToken = "";
      Response<dynamic> result = await super.postData(
          path: '/users/login',
          params: {'username': data.username, 'password': data.password});
      if (result.data['code'] == 200) {
        token = result.data['data']['access_token'];
        refeshToken = result.data['data']['refresh_token'];
        return ResponseModel(
            data: {"token": token, "refresh_token": refeshToken},
            getSuccess: true,
            message: "Lấy token thành công");
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

  Future<ResponseModel> updateFullNameAccount(
      {required String fullName, required int accountId}) async {
    try {
      Response<dynamic> result = await super.putData(
          path: '/accounts/fullname/$accountId',
          params: {"fullname": fullName});
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: fullName,
            getSuccess: true,
            message: "Thay đổi tên thành công");
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

  Future<ResponseModel> getListFollower(
      {required TypeFollwer type,
      required int fromId,
      required int page,
      required int pageSize}) async {
    try {
      FriendStatusModel typeFriend = FriendStatusModel.equalType(type);
      String typeFollwer = typeFriend.nameFollower;

      Response<dynamic> result = await super.getData(
          path: '/follower',
          queryParameters: {
            'from_id': fromId,
            'status': typeFollwer,
            'page': page,
            'page_size': pageSize
          });

      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        List<UserModel> users = [];
        for (var e in result.data['data']['account']) {
          users.add(UserModel.fromJson(e));
        }
        return ResponseModel(
            data: {'accounts': users, 'total': result.data['data']['total']},
            getSuccess: true,
            message: "Lấy dữ liệu thành công");
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

  Future<ResponseModel> acceptFriend(
      {required int currentAccountId, required int viaAccountId}) async {
    try {
      Response<dynamic> result =
          await super.putData(path: '/follower', params: {
        'from_follow': currentAccountId,
        'to_follow': viaAccountId,
      });

      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data,
            getSuccess: true,
            message: "Thay đổi tên thành công");
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

  Future<ResponseModel> createFollower(
      {required int currentAccountId, required int viaAccountId}) async {
    try {
      Response<dynamic> result = await super.postData(
          path: '/follower',
          params: {"from_id": currentAccountId, "to_id": viaAccountId});

      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: "Da gui loi moi ket ban",
            getSuccess: true,
            message: "Đã gửi lời mời kết bạn");
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

  Future<ResponseModel> removeFriend(
      {required int currentAccountId, required int viaAccountId}) async {
    try {
      Response<dynamic> result = await super.deleteData(
          path: '/follower',
          params: {"from_follow": currentAccountId, "to_follow": viaAccountId});

      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data, getSuccess: true, message: "Đã hủy bạn bè");
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

  Future<ResponseModel> checkStatusFriend(
      {required int currentAccountId, required int viaAccountId}) async {
    try {
      Response<dynamic> result = await super.getData(
          path: '/follower/status',
          queryParameters: {
            "from_id": currentAccountId,
            "to_id": viaAccountId
          });

      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        String status = result.data['data']['status'];
        FriendStatusModel statusFriend = FriendStatusModel.equalString(status);
        return ResponseModel(
            data: statusFriend,
            getSuccess: true,
            message: "Thay đổi tên thành công");
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
