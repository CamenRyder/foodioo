import 'package:dio/dio.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

import '../../Core/Helper/dio_sepecificate.dart';
import '../../Core/Helper/validate_code_response.dart';
import '../models/react_model.dart';

class PostService extends FetchClient {
  Future<ResponseModel> getNewFeed(
      {required int page, required int pageSize}) async {
    try {
      List<PostModel> postModels = [];

      final Response<dynamic> result =
          await super.getData(path: '/posts?page=$page&page_size=$pageSize');
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final posts = result.data['data'];

        for (var e in posts) {
          postModels.add(PostModel.fromJson(e));
        }
        return ResponseModel(
            data: postModels,
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

  Future<void> likePost({required int postId, required int accountId}) async {
    await super.postData(
        path: '/react', params: {"post_id": postId, "account_id": accountId});
  }

  Future<ResponseModel> getAccountsReactYourSelf(
      {required int accountId, required int postId}) async {
    try {
      final Response<dynamic> result = await super.getData(
          path: '/react',
          queryParameters: {"post_id": postId, "account_id": accountId});
      List<ReactModel> accounts = [];
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final accountLiked = result.data['data'];
        // đang bị sai

        for (var e in accountLiked) {
          accounts.add(ReactModel.fromJson(e));
        }
        return ResponseModel(
            data: accountLiked,
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

  Future<ResponseModel> getAccountsReactPost(
      {required int postId, required int page, required int pageSize}) async {
    try {
      final Response<dynamic> result = await super.getData(
          path: '/react/post/$postId',
          queryParameters: {"page": page, "page_size": pageSize});
      List<ReactModel> accounts = [];
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final accountLiked = result.data['data']['react'];
        // đang bị sai
        if (accountLiked == null) {
          return ResponseModel(
              data: accounts,
              getSuccess: true,
              message: AppConstant.messageGetSuccesData);
        }
        for (var e in accountLiked) {
          accounts.add(ReactModel.fromJson(e));
        }
        return ResponseModel(
            data: accounts,
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

  Future<void> unlikePost({required int postId, required int accountId}) async {
    await super.deleteData(
        path: '/react', params: {"post_id": postId, "account_id": accountId});
  }
}
