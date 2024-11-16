import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/comment/comment_event.dart';
import 'package:foodioo/repositories/blocs/comment/comment_state.dart';
import 'package:foodioo/repositories/models/comments_model.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentState()) {
    on<InitialLoaingComments>(
        (event, emit) => _onInitialLoaingComments(event, emit));
    on<FetchedComments>((event, emit) => _onFetchedComments(event, emit));
  }

  PostService postService = PostService();
  int pageSize = AppConstant.pageSize;

  _onFetchedComments(FetchedComments event, Emitter<CommentState> emit) async {
    try {
      if (event.page == 1) {
        emit(state.copyWith(isLoading: true));
        ResponseModel response = await postService.getCommentsPost(
            page: event.page, pageSize: pageSize, postId: state.postId);

        if (response.getSuccess) {
          List<CommentModel> models = response.data as List<CommentModel>;
          emit(state.copyWith(
            isLoading: false,
            commentModels: models,
            isHasReachedCommnent: false,
            isShowMessage: true,
            message: response.message,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isShowMessage: true,
            isHasReachedCommnent: true,
            message: response.message,
          ));
        }
      } else if (!state.isHasReachedCommnent) {
        ResponseModel response = await postService.getCommentsPost(
            page: event.page, pageSize: pageSize, postId: state.postId);
        if (response.getSuccess) {
          List<CommentModel> models = response.data as List<CommentModel>;

          List<CommentModel> currentComments = state.commentModels;

          currentComments.addAll(models);
          emit(state.copyWith(
            isLoading: false,
            commentModels: currentComments,
            isHasReachedCommnent: models.isEmpty,
            isShowMessage: true,
            message: response.message,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isShowMessage: true,
            isHasReachedCommnent: true,
            message: response.message,
          ));
        }
      }
    } catch (err) {
      emit(state.copyWith(
        isShowMessage: true,
        isLoading: false,
        message: err.toString(),
      ));
    }
  }

  _onInitialLoaingComments(
      InitialLoaingComments event, Emitter<CommentState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      ResponseModel response = await postService.getCommentsPost(
          page: 1, pageSize: pageSize, postId: event.postId);

      if (response.getSuccess) {
        List<CommentModel> models = response.data as List<CommentModel>;
        emit(state.copyWith(
          isLoading: false,
          currentAccountId: event.currentAccounId,
          postId: event.postId,
          commentModels: models,
          isShowMessage: true,
          isHasReachedCommnent: false,
          message: response.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isShowMessage: true,
        isLoading: false,
        message: e.toString(),
      ));
    }
  }
}
