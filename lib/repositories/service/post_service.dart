import 'package:dio/dio.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/models/comments_model.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

import '../../Core/Helper/dio_sepecificate.dart';
import '../../Core/Helper/validate_code_response.dart';
import '../models/react_model.dart';

class PostService extends FetchClient {
  Future<ResponseModel> getNewFeed(
      {required int page,
      required int pageSize,
      required int accountId}) async {
    try {
      List<PostModel> postModels = [];

      final Response<dynamic> result = await super.getData(
          path: '/posts?account_id=$accountId&page=$page&page_size=$pageSize');
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        final posts = result.data['data'];
        if (posts == null) {
          return ResponseModel(
              data: postModels,
              getSuccess: true,
              message: AppConstant.messageGetSuccesData);
        }
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

/*

{
            'account_id': accountId,
            'description': description,
            'images': [await MultipartFile.fromFile(fileUrl)],
          }

*/
  Future<ResponseModel> createPostData({
    required String description,
    required int accountId,
    String? lng,
    String? lat,
    List<String>? imageUrl,
  }) async {
    try {
      Map<String, dynamic> mapForm = {};
      if (imageUrl != null) {
        switch (imageUrl.length) {
          case 1:
            mapForm = {
              'account_id': accountId,
              'description': description,
              'lng': lng,
              'lat': lat,
              'images': [await MultipartFile.fromFile(imageUrl[0])],
            };
            break;
          case 2:
            mapForm = {
              'account_id': accountId,
              'description': description,
              'lng': lng,
              'lat': lat,
              'images': [
                await MultipartFile.fromFile(imageUrl[0]),
                await MultipartFile.fromFile(imageUrl[1])
              ],
            };
            break;
          case 3:
            mapForm = {
              'account_id': accountId,
              'description': description,
              'lng': lng,
              'lat': lat,
              'images': [
                await MultipartFile.fromFile(imageUrl[0]),
                await MultipartFile.fromFile(imageUrl[1]),
                await MultipartFile.fromFile(imageUrl[2])
              ],
            };
            break;
          case 4:
            mapForm = {
              'account_id': accountId,
              'description': description,
              'lng': lng,
              'lat': lat,
              'images': [
                await MultipartFile.fromFile(imageUrl[0]),
                await MultipartFile.fromFile(imageUrl[1]),
                await MultipartFile.fromFile(imageUrl[2]),
                await MultipartFile.fromFile(imageUrl[3])
              ],
            };
            break;
          default:
            mapForm = {
              'account_id': accountId,
              'description': description,
              'lng': lng,
              'lat': lat,
            };
            break;
        }
      }
      final Response<dynamic> result = await super
          .createPost('http://foodioo.camenryder.xyz/api/posts', mapForm);
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data['data'],
            getSuccess: true,
            message: "Đăng bài viết thành công");
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

  Future<ResponseModel> deletePost({required int postId}) async {
    try {
      final Response<dynamic> result =
          await super.postData(path: '/posts/soft-delete/$postId');
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data['data'],
            getSuccess: true,
            message: "Xóa bài viết thành công");
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

  Future<ResponseModel> getCommentsPost(
      {required int postId, required int page, required int pageSize}) async {
    try {
      final Response<dynamic> results = await super.getData(
        path: '/comments?post_id=$postId&page=$page&page_size=$pageSize',
      );
      if (results.data['code'] >= 200 && results.data['code'] < 300) {
        List<CommentModel> comments =  [];
        for(var e in results.data['data']){
          comments.add(CommentModel.fromJson(e));
        }
        return ResponseModel(
            data: comments ,
            getSuccess: true,
            message: AppConstant.messageGetSuccesData);
      }
      return ResponseModel(
        data: null,
        getSuccess: false,
        message: ValidateCodeResponse.showErorrResponse(results.data['code']),
      );
    } catch (e) {
      return ResponseModel(
        data: null,
        getSuccess: false,
        message: "Đã có lỗi: $e",
      );
    }
  }

  Future<ResponseModel> createCommentPost(
      {required int postId,
      required int accountId,
      required String description,
      String? imageUrl}) async {
    try {
      final Response<dynamic> result = await super.createComment(
          url: 'http://foodioo.camenryder.xyz/api/comments',
          mapDataForm: {
            'account_id': accountId,
            'post_id': postId,
            'description': description,
            if (imageUrl != null)
              'images': [await MultipartFile.fromFile(imageUrl)]
          });
      if (result.data['code'] >= 200 && result.data['code'] < 300) {
        return ResponseModel(
            data: result.data['data'],
            getSuccess: true,
            message: "Bình luận thành công");
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
