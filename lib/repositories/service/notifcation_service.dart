import 'package:dio/dio.dart';
import 'package:foodioo/repositories/models/notification_model.dart';

import '../../Core/Constants/constant_stataue.dart';
import '../../Core/Helper/dio_sepecificate.dart';
import '../../Core/Helper/validate_code_response.dart';
import '../models/report_model.dart';
import '../view/login_vm.dart';

class NotifcationService extends FetchClient {
  Future<ResponseModel> getYourNotification(
      {required int page,
      required int pageSize,
      required int accountId}) async {
    try {
      List<NotificationModel> notifications = [];

      final Response<dynamic> result = await super.getData(
          path: '/notification/$accountId',
          queryParameters: {"page": page, "page_size": pageSize});
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final notifyData = result.data['data'];
        if (notifyData == null) {
          return ResponseModel(
              data: notifications,
              getSuccess: true,
              message: AppConstant.messageGetSuccesData);
        }
        for (var e in notifyData) {
          notifications.add(NotificationModel.fromJson(e));
        }
        return ResponseModel(
            data: notifications,
            getSuccess: true,
            message: AppConstant.messageGetSuccesData);
      }
      return ResponseModel(
        data: null,
        getSuccess: false,
        message: ValidateCodeResponse.showErorrResponse(result.data['code']),
      );
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }

  Future<ResponseModel> seenNotification({required int notifcationId}) async {
    try {
      final Response<dynamic> result = await super.putData(
        path: '/notification/$notifcationId',
      );
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: true,
            getSuccess: true,
            message: AppConstant.messageGetSuccesData);
      }
      return ResponseModel(
        data: false,
        getSuccess: false,
        message: ValidateCodeResponse.showErorrResponse(result.data['code']),
      );
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }

  Future<ResponseModel> seenAllNotification(
      {required int accountId}) async {
    try {
      final Response<dynamic> result = await super.putData(
        path: '/notification/$accountId',
      );
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: true,
            getSuccess: true,
            message: AppConstant.messageGetSuccesData);
      }
      return ResponseModel(
        data: false,
        getSuccess: false,
        message: ValidateCodeResponse.showErorrResponse(result.data['code']),
      );
    } catch (e) {
      return ResponseModel(
          getSuccess: false, message: "Đã có lỗi: $e", data: null);
    }
  }
}
