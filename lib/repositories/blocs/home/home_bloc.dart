import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/models/react_model.dart';
import 'package:foodioo/repositories/models/report_model.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/service/report_service.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

import '../../../Core/Constants/constant_stataue.dart';
import '../../../Core/Helper/dio_sepecificate.dart';
import '../../models/post_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<FetchNewFeed>(_fetchNewFeed);
    on<InitalLoading>(_initalLoading);
    on<LikePost>(_likePost);
    on<UnLikePost>(_disLikePost);
    on<GetAccountReactPost>(_getAccountReactPost);
    on<DeletePost>(_onDeletePost);
    on<RefreshNewFeed>(_onRefreshNewFeed);
    on<FetchYourReport>(_onFetchYourReport);
    on<PickReport>(_onPickReport);
    on<UnPickReport>(_onUnPickReport);
    on<MultiPickReport>(_onMultiPickReport);
  }

  PostService postService = PostService();
  ReportService reportService = ReportService();

  int pageSize = AppConstant.pageSize;

  _onUnPickReport(UnPickReport event, Emitter<HomeState> emit) {
    List<int> pickedIssues = state.pickedIssues;
    pickedIssues.remove(event.issueId);
    emit(state.copyWith(pickedIssues: pickedIssues));
  }

  _onPickReport(PickReport event, Emitter<HomeState> emit) {
    List<int> pickedIssues = state.pickedIssues;
    pickedIssues.add(event.issueId);
    emit(state.copyWith(pickedIssues: pickedIssues));
  }

  _onFetchYourReport(FetchYourReport event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingYourReportIntoPost: true, pickedIssues: []));
    ResponseModel data = await reportService.getYourIssueTicked(
        accountId: state.currentAccountId, postId: event.postId);
    if (data.getSuccess) {
      emit(state.copyWith(
          issuesTicked: data.data, isLoadingYourReportIntoPost: false));
    } else {
      emit(
          state.copyWith(issuesTicked: [], isLoadingYourReportIntoPost: false));
    }
  }

  _onMultiPickReport(MultiPickReport event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingPostReport: true));
    ResponseModel data = await reportService.createIssues(
        accountId: state.currentAccountId,
        issuesId:
            state.pickedIssues.toSet().toList(), // lọc list ko bị trùng lặp.
        postId: event.postId);
    if (data.getSuccess) {
      emit(state.copyWith(
          isPostedReport: true, isLoadingPostReport: false, issuesTicked: []));
    } else {
      emit(state.copyWith(isPostedReport: false, isLoadingPostReport: false));
    }
  }

  _onRefreshNewFeed(RefreshNewFeed event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isRefreshFeed: true));
  }

  _onDeletePost(DeletePost event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(isLoadingDeletePost: true));
      ResponseModel res = await postService.deletePost(postId: event.postId);
      if (res.getSuccess) {
        emit(state.copyWith(
            isLoadingDeletePost: false,
            isShowMessage: true,
            isRefreshFeed: true,
            message: "Xóa bài viết thành công!"));
      } else {
        throw Exception(res.message);
      }
    } catch (e) {
      emit(state.copyWith(isLoadingDeletePost: false));
      emit(state.copyWith(isShowMessage: true, message: e.toString()));
    }
  }

  _getAccountReactPost(
      GetAccountReactPost event, Emitter<HomeState> emit) async {
    try {
      if (event.page == null) {
        emit(state.copyWith(isLoadingAccountsReact: true));
        ResponseModel res = await postService.getAccountsReactPost(
            postId: event.postId, page: 1, pageSize: AppConstant.pageSize);
        if (res.getSuccess) {
          emit(state.copyWith(
              isLoadingAccountsReact: false,
              reactModels: res.data,
              hasReachedReactPost: false));
        } else {
          throw Exception(res.message);
        }
      } else if (!state.hasReachedReactPost) {
        ResponseModel res = await postService.getAccountsReactPost(
            postId: event.postId,
            page: event.page!,
            pageSize: AppConstant.pageSize);
        if (res.getSuccess) {
          List<ReactModel> reactBuff = res.data;
          final dataaa = [...state.reactModels, ...reactBuff];
          emit(state.copyWith(
            reactModels: dataaa,
            hasReachedReactPost: reactBuff.isEmpty,
          ));
        } else {
          throw Exception(res.message);
        }
      }
    } catch (err) {
      emit(state.copyWith(
          isLoadingAccountsReact: false,
          isShowMessage: true,
          message: err.toString()));
    }
  }

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
        final ResponseModel response = await postService.getNewFeed(
            page: event.page,
            pageSize: pageSize,
            accountId: state.currentAccountId);
        if (response.getSuccess) {
          List<PostModel> posts = response.data;
          emit(state.copyWith(postModels: posts, isLoadingNewFeed: false));
        } else {
          throw Exception(response.message);
        }
      } else if (!state.hasReachedPost) {
        
        final ResponseModel response = await postService.getNewFeed(
            page: event.page,
            pageSize: pageSize,
            accountId: state.currentAccountId);
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

      ResponseModel res = await postService.getNewFeed(
          page: 1, pageSize: pageSize, accountId: event.currentAccountId);
      ResponseModel res2 = await reportService.getIssuesForReport();
      if (res.getSuccess && res2.getSuccess) {
        List<ReportModel> issues = res2.data;
        List<PostModel> posts = res.data;
        emit(state.copyWith(
            postModels: posts,
            isLoadingNewFeed: false,
            issuesDefault: issues,
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
