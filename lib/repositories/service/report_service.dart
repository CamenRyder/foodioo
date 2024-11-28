import 'package:dio/dio.dart';

import '../../Core/Constants/constant_stataue.dart';
import '../../Core/Helper/dio_sepecificate.dart';
import '../../Core/Helper/validate_code_response.dart';
import '../models/report_model.dart';
import '../view/login_vm.dart';

class ReportService extends FetchClient {
  Future<ResponseModel> getIssuesForReport() async {
    try {
      List<ReportModel> issues = [];

      final Response<dynamic> result =
          await super.getData(path: '/report-post/issue', queryParameters: {});
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final issuesData = result.data['data'];
        if (issuesData == null) {
          return ResponseModel(
              data: issues,
              getSuccess: true,
              message: AppConstant.messageGetSuccesData);
        }
        for (var e in issuesData) {
          issues.add(ReportModel.fromJson(e));
        }
        return ResponseModel(
            data: issues,
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

  Future<ResponseModel> getYourIssueTicked(
      {required int postId, required int accountId}) async {
    try {
      final Response<dynamic> result = await super.postData(
          path: '/report-post/your-report',
          params: {"post_id": postId, "account_id": accountId});
      List<ReportModel> issues = [];
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final issuesData = result.data['data'];
        if (issuesData == null) {
          return ResponseModel(
              data: issues,
              getSuccess: true,
              message: AppConstant.messageGetSuccesData);
        }
        for (var e in issuesData) {
          issues.add(ReportModel.fromJson(e));
        }
        return ResponseModel(
            data: issues,
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

  Future<ResponseModel> createIssues(
      {required int postId,
      required int accountId,
      required List<int> issuesId}) async {
    try {
      final Response<dynamic> result = await super.postData(
          path: '/report-post',
          params: {
            "account_id": accountId,
            "list_issue_id": issuesId.toList(),
            "post_id": postId
          });
      List<ReportModel> issues = [];
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final issuesData = result.data['data'];
        if (issuesData == null) {
          return ResponseModel(
              data: issues,
              getSuccess: true,
              message: AppConstant.messageGetSuccesData);
        }
        for (var e in issuesData) {
          issues.add(ReportModel.fromJson(e));
        }
        return ResponseModel(
            data: issues,
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
}
