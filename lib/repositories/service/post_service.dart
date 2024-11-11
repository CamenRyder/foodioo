import 'package:dio/dio.dart';
import 'package:foodioo/repositories/models/post_model.dart';

import '../../Core/Helper/dio_sepecificate.dart';

class PostService extends FetchClient {
  Future<List<PostModel>> getNewFeed(
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
      }
      return postModels;
    } catch (e) {
      return [];
    }
  }
}