import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/profile/profile_event.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/service/user_service.dart';

import '../../view/login_vm.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(userModel: UserModel())) {
    on<InitalLoadingProfile>(_onInitalLoadingProfile);
    on<InputDescriptionToUploadPost>(_onInputDescriptionToUploadPost);
    on<FetchAccountPosts>(_onFetchAccountPosts);
    on<FetchAccountUser>(_onFetchAccountUser);
    on<RefreshAccountPosts>(_onRefreshAccountPosts);
    on<FastUploadPost>(_onFastUploadPost);
    on<InputFullName>(_onInputFullName);
    on<ChangeFullName>(_onChangeFullName);
    // on<ChangeAvatarImage>(_onChangeAvatarImage);
    // on<ChangeBackgroundImage>(_onChangeBackgroundImage);
  }

  UserService userService = UserService();
  PostService postService = PostService();
  int pageSize = AppConstant.pageSize;

  _onFetchAccountUser(FetchAccountUser event, Emitter emit) async {
    try {
      final rs = userService.getUserById(accountId: state.currentAccountId );  

    } catch (e) {
      emit(state.copyWith(
          isShowMessages: true,
          message: e.toString(),
          isLoadingPosts: false,
          isLoadingUpdate: false));
    }
  }

  _onInputFullName(InputFullName event, Emitter emit) async {
    emit(state.copyWith(dynamicUpdateField: event.updateName));
  }

  _onChangeFullName(ChangeFullName event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoadingUpdate: true));
      final rs = await userService.updateFullNameAccount(
          accountId: event.curentAccountId, fullName: state.dynamicUpdateField);
      if (rs.getSuccess) {
        emit(state.copyWith(isLoadingUpdate: false, isUpdateSuccess: true));
      } else {
        emit(state.copyWith(isLoadingUpdate: false));
      }
    } catch (e) {
      emit(state.copyWith(
          isShowMessages: true,
          message: e.toString(),
          isLoadingPosts: false,
          isLoadingUpdate: false));
    }
  }

  _onRefreshAccountPosts(
      RefreshAccountPosts event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoadingPosts: true));

      ResponseModel data = await postService.getPostsByAccountId(
          currentAccountId: state.currentAccountId,
          aimAccountId: state.currentAccountId,
          pageSize: pageSize,
          page: 1);
      if (data.getSuccess) {
        emit(state.copyWith(
            postModels: data.data,
            isLoadingPosts: false,
            isHasReachedPost: false,
            page: 1));
      } else {
        emit(state.copyWith(
            isLoadingPosts: false,
            isHasReachedPost: false,
            isShowMessages: true,
            page: 1,
            message: data.message));
      }
    } catch (e) {
      emit(state.copyWith(
          isShowMessages: true, message: e.toString(), isLoadingPosts: false));
    }
  }

  _onFetchAccountPosts(
      FetchAccountPosts event, Emitter<ProfileState> emit) async {
    try {
      int page = ++state.page;
      if (!state.isHasReachedPost) {
        ResponseModel data = await postService.getPostsByAccountId(
            currentAccountId: state.currentAccountId,
            aimAccountId: state.currentAccountId,
            pageSize: pageSize,
            page: page);
        List<PostModel> currentPosts = state.postModels;
        if (data.getSuccess) {
          currentPosts.addAll(data.data);
          emit(state.copyWith(
            postModels: currentPosts,
            isLoadingPosts: false,
            page: page,
            isHasReachedPost: data.data.isEmpty,
          ));
        } else {
          emit(state.copyWith(
              isLoadingPosts: false,
              isHasReachedPost: false,
              isShowMessages: true,
              page: 1,
              message: data.message));
        }
      }
    } catch (e) {
      emit(state.copyWith(isShowMessages: true, message: e.toString()));
    }
  }

  _onFastUploadPost(FastUploadPost event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoadingOverLay: true));
      ResponseModel data = await postService.createPostData(
          accountId: state.currentAccountId, description: state.description);
      if (data.getSuccess) {
        emit(state.copyWith(
            isLoadingOverLay: false,
            isShowMessages: true,
            message: "Đăng bài thành công"));
        add(InputDescriptionToUploadPost(description: ""));
        add(RefreshAccountPosts());
      } else {
        emit(state.copyWith(
            isLoadingOverLay: false,
            isShowMessages: true,
            description: "",
            message: data.message));
      }
    } catch (e) {
      emit(state.copyWith(isShowMessages: true, message: e.toString()));
    }
  }

  _onInputDescriptionToUploadPost(
      InputDescriptionToUploadPost event, Emitter<ProfileState> emit) {
    try {
      emit(state.copyWith(description: event.description));
    } catch (e) {
      emit(state.copyWith(isShowMessages: true, message: e.toString()));
    }
  }

  _onInitalLoadingProfile(
      InitalLoadingProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoadingScreen: true));
      final rsData = await Future.wait([
        userService.getUserById(accountId: event.accountId),
        postService.getPostsByAccountId(
            currentAccountId: event.accountId,
            aimAccountId: event.accountId,
            pageSize: pageSize,
            page: 1)
      ]);
      if (rsData[0].getSuccess && rsData[1].getSuccess) {
        emit(state.copyWith(
            userModel: rsData[0].data,
            postModels: rsData[1].data,
            currentAccountId: event.accountId,
            page: 1,
            isLoadingScreen: false));
      } else {
        emit(state.copyWith(
            isShowMessages: true,
            message: rsData[0].message,
            page: 1,
            isLoadingScreen: false));
      }
    } catch (e) {
      emit(state.copyWith(isShowMessages: true, message: e.toString()));
    }
  }
}
