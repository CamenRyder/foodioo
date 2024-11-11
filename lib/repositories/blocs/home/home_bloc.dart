import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/service/post_service.dart';

import '../../../Core/Constants/constant_stataue.dart';
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
        final posts =
            await postService.getNewFeed(page: event.page, pageSize: pageSize);

        emit(state.copyWith(postModels: posts, isLoadingNewFeed: false));
      } else if (!state.hasReachedPost) {
        final posts =
            await postService.getNewFeed(page: event.page, pageSize: pageSize);

        emit(state.copyWith(
            postModels: [...state.postModels, ...posts],
            hasReachedPost:
                posts.isEmpty, // trả rỗng thì đến cuối data. ko gọi data nữa
            isLoadingNewFeed: false));
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
      final posts = await postService.getNewFeed(page: 1, pageSize: pageSize);

      emit(state.copyWith(
          postModels: posts,
          isLoadingNewFeed: false,
          currentAccountId: event.currentAccountId));
    } catch (err) {
      emit(state.copyWith(
          isLoadingNewFeed: false,
          isShowMessage: true,
          message: err.toString()));
    }
  }
}
