import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

import '../../../Core/Constants/constant_stataue.dart';
import '../../models/post_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<FetchNewFeed>(_fetchNewFeed);
    on<InitalLoading>(_initalLoading);
    on<LikePost>(_likePost);
    on<UnLikePost>(_disLikePost);
  }

  PostService postService = PostService();
  int pageSize = AppConstant.pageSize;

  _likePost(LikePost event, Emitter<HomeState> emit) {
    postService.likePost(
        postId: event.postId, accountId: state.currentAccountId);
  }

  _disLikePost(UnLikePost event, Emitter<HomeState> emit) {
    postService.unlikePost(
        postId: event.postId, accountId: state.currentAccountId);
  }

  _fetchNewFeed(FetchNewFeed event, Emitter<HomeState> emit) async {
    try {
      if (event.page == 1) {
        emit(state.copyWith(isLoadingNewFeed: true));

        final ResponseModel response =
            await postService.getNewFeed(page: event.page, pageSize: pageSize);
        if (response.getSuccess) {
          List<PostModel> posts = response.data;
          emit(state.copyWith(postModels: posts, isLoadingNewFeed: false));
        } else {
          throw Exception(response.message);
        }
      } else if (!state.hasReachedPost) {
        final ResponseModel response =
            await postService.getNewFeed(page: event.page, pageSize: pageSize);
        if (response.getSuccess) {
          List<PostModel> posts = response.data;
          emit(state.copyWith(
              postModels: [...state.postModels, ...posts],
              hasReachedPost:
                  posts.isEmpty, // trả rỗng thì đến cuối data. ko gọi data nữa
              isLoadingNewFeed: false));
        } else {
          throw Exception(response.message);
        }
      }
    } catch (err) {
      emit(state.copyWith(
          isLoadingNewFeed: false,
          isShowMessage: true,
          message: err.toString()));
    }
  }

  _initalLoading(InitalLoading event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(isLoadingNewFeed: true));
      ResponseModel res =
          await postService.getNewFeed(page: 1, pageSize: pageSize);
      if (res.getSuccess) {
        List<PostModel> posts = res.data;
        emit(state.copyWith(
            postModels: posts,
            isLoadingNewFeed: false,
            currentAccountId: event.currentAccountId));
      } else {
        throw Exception(res.message);
      }
    } catch (err) {
      emit(state.copyWith(
          isLoadingNewFeed: false,
          isShowMessage: true,
          message: err.toString()));
    }
  }
}
