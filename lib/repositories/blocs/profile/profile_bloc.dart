import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/profile/profile_event.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/friend_status_model.dart';
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
    on<ChangeAvatarImage>(_onChangeAvatarImage);
    on<RemoveAvatarImage>(_onRemoveAvatarImage);
    on<PostChangeAvatarImage>(_onPostChangeAvatarImage);
    on<ChangeBackgroundImage>(_onChangeBackgroundImage);
    on<RemoveChangeBackgroundImage>(_onRemoveChangeBackgroundImage);
    on<PostChangeBackgroundImage>(_onPostChangeBackgroundImage);
    on<GetListFriends>(_onGetListFriends);
    on<RefreshListFriend>(_onRefreshListFriend);
    on<AcceptFollower>(_onAcceptFollower);
    on<DenyFollower>(_onDenyFollower);
    on<RemoveFriend>(_onRemoveFriend);
    on<FollowAccount>(_onFollowAccount);
  }

  UserService userService = UserService();
  PostService postService = PostService();
  int pageSize = AppConstant.pageSize;
  int pageSizeFollow = 20;

  _onAcceptFollower(AcceptFollower event, Emitter emit) {
    userService.acceptFriend(
        currentAccountId: state.currentAccountId,
        viaAccountId: event.followerAccountId);
  }

  _onDenyFollower(DenyFollower event, Emitter emit) {
    userService.removeFriend(
        currentAccountId: state.currentAccountId,
        viaAccountId: event.followerAccountId);
  }

  _onRemoveFriend(RemoveFriend event, Emitter emit) async {
    userService.removeFriend(
        currentAccountId: state.currentAccountId,
        viaAccountId: event.friendAccountId);
  }

  _onFollowAccount(FollowAccount event, Emitter emit) {
    userService.createFollower(
        currentAccountId: state.currentAccountId,
        viaAccountId: event.accountId);
  }

  _onRefreshListFriend(RefreshListFriend event, Emitter emit) {
    if (event.type == TypeFollwer.request) {
      emit(state.copyWith(
          hasReachedListRequested: false, pageRequested: 1, requestedList: []));
      add(GetListFriends(type: event.type));
    } else if (event.type == TypeFollwer.accept) {
      emit(state.copyWith(
          hasReachedListAccept: false, pageFollwer: 1, followerList: []));
      add(GetListFriends(type: event.type));
    } else if (event.type == TypeFollwer.friend) {
      emit(state.copyWith(
          hasReachedListFriend: false, pageFriend: 1, friendList: []));
      add(GetListFriends(type: event.type));
    }
  }

  _onGetListFriends(GetListFriends event, Emitter emit) async {
    try {
      if (event.type == TypeFollwer.request && !state.hasReachedListRequested) {
        int page = state.pageRequested;
        if (page == 1) {
          emit(state.copyWith(isLoadingListRequested: true));
        }
        ResponseModel data = await userService.getListFollower(
            type: event.type,
            fromId: state.viaAccountId,
            page: page,
            pageSize: pageSizeFollow);
        emit(state.copyWith(
            hasReachedListRequested: data.data['accounts'].isEmpty,
            isLoadingListRequested: false,
            totalRequested: data.data['total'],
            requestedList: [...state.requestedList, ...data.data['accounts']],
            pageRequested: ++page));
      } else if (event.type == TypeFollwer.accept &&
          !state.hasReachedListAccept) {
        int page = state.pageFollwer;
        if (page == 1) {
          emit(state.copyWith(isLoadingListAccept: true));
        }
        ResponseModel data = await userService.getListFollower(
            type: event.type,
            fromId: state.viaAccountId,
            page: page,
            pageSize: pageSizeFollow);
        emit(state.copyWith(
            hasReachedListAccept: data.data['accounts'].isEmpty,
            isLoadingListAccept: false,
            totalFollower: data.data['total'],
            followerList: [...state.followerList, ...data.data['accounts']],
            pageFollwer: ++page));
      } else if (event.type == TypeFollwer.friend &&
          !state.hasReachedListFriend) {
        int page = state.pageFriend;
        if (page == 1) {
          emit(state.copyWith(isLoadingListFriend: true));
        }
        ResponseModel data = await userService.getListFollower(
            type: event.type,
            fromId: state.viaAccountId,
            page: page,
            pageSize: pageSizeFollow);
        emit(state.copyWith(
            hasReachedListFriend: data.data['accounts'].isEmpty,
            isLoadingListFriend: false,
            totalFriend: data.data['total'],
            friendList: [...state.friendList, ...data.data['accounts']],
            pageFriend: ++page));
      }
    } catch (e) {
      emit(state.copyWith(
          isShowMessages: true,
          message: e.toString(),
          isLoadingPosts: false,
          isLoadingUpdate: false));
    }
  }

  _onChangeBackgroundImage(ChangeBackgroundImage event, Emitter emit) {
    emit(state.copyWith(dynamicUpdateField: event.backgroundImageUrl));
  }

  _onRemoveChangeBackgroundImage(
      RemoveChangeBackgroundImage event, Emitter emit) {
    emit(state.copyWith(dynamicUpdateField: ""));
  }

  _onPostChangeBackgroundImage(
      PostChangeBackgroundImage event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoadingUpdate: true));
      final formdata = FormData.fromMap({
        'account_id': state.currentAccountId,
        'image': await MultipartFile.fromFile(state.dynamicUpdateField),
      });
      final data = await userService.putData(
          path: '/accounts/background', params: formdata);

      if (data.data['code'] >= 200 && data.data['code'] < 300) {
        emit(state.copyWith(isLoadingUpdate: false, isUpdateSuccess: true));
        add(FetchAccountUser());
      } else {
        emit(state.copyWith(
            isLoadingUpdate: false,
            isUpdateSuccess: false,
            isShowMessages: true,
            message: "Lỗi hệ thống"));
      }
    } catch (e) {
      emit(state.copyWith(
          isShowMessages: true,
          message: e.toString(),
          isLoadingPosts: false,
          isLoadingUpdate: false));
    }
  }

  _onChangeAvatarImage(ChangeAvatarImage event, Emitter emit) async {
    emit(state.copyWith(dynamicUpdateField: event.avatarUrl));
  }

  _onRemoveAvatarImage(RemoveAvatarImage event, Emitter emit) {
    emit(state.copyWith(dynamicUpdateField: ""));
  }

  _onPostChangeAvatarImage(PostChangeAvatarImage event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoadingUpdate: true));
      final formdata = FormData.fromMap({
        'account_id': state.currentAccountId,
        'image': await MultipartFile.fromFile(state.dynamicUpdateField),
      });
      final data =
          await userService.putData(path: '/accounts/avatar', params: formdata);

      if (data.data['code'] >= 200 && data.data['code'] < 300) {
        emit(state.copyWith(isLoadingUpdate: false, isUpdateSuccess: true));
        add(FetchAccountUser());
      } else {
        emit(state.copyWith(
            isLoadingUpdate: false,
            isUpdateSuccess: false,
            isShowMessages: true,
            message: "Lỗi hệ thống"));
      }
    } catch (e) {
      emit(state.copyWith(
          isShowMessages: true,
          message: e.toString(),
          isLoadingPosts: false,
          isLoadingUpdate: false));
    }
  }

  _onFetchAccountUser(FetchAccountUser event, Emitter emit) async {
    try {
      ResponseModel rs =
          await userService.getUserById(accountId: state.viaAccountId);
      if (rs.getSuccess) {
        emit(state.copyWith(
            isUpdateSuccess: false,
            userModel: rs.data,
            dynamicUpdateField: "",
            message: "Cập nhập thành công",
            isShowMessages: true));
      }
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
          accountId: state.currentAccountId,
          fullName: state.dynamicUpdateField);
      if (rs.getSuccess) {
        emit(state.copyWith(isLoadingUpdate: false, isUpdateSuccess: true));
        add(FetchAccountUser());
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
          aimAccountId: state.viaAccountId,
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
            aimAccountId: state.viaAccountId,
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
        userService.getUserById(accountId: event.viaAccountId),
        postService.getPostsByAccountId(
            currentAccountId: event.currentAccountId,
            aimAccountId: event.viaAccountId,
            pageSize: pageSize,
            page: 1),
        userService.getListFollower(
            type: TypeFollwer.friend,
            fromId: event.viaAccountId,
            page: 1,
            pageSize: pageSizeFollow),
        userService.getListFollower(
            type: TypeFollwer.accept,
            fromId: event.viaAccountId,
            page: 1,
            pageSize: pageSizeFollow),
        userService.getListFollower(
            type: TypeFollwer.request,
            fromId: event.viaAccountId,
            page: 1,
            pageSize: pageSizeFollow),
        userService.checkStatusFriend(
            currentAccountId: event.currentAccountId,
            viaAccountId: event.currentAccountId),
      ]);
      if (rsData[0].getSuccess && rsData[1].getSuccess) {
        emit(state.copyWith(
            userModel: rsData[0].data,
            postModels: rsData[1].data,
            friendList: rsData[2].data['accounts'],
            totalFriend: rsData[2].data['total'],
            followerList: rsData[3].data['accounts'],
            totalFollower: rsData[3].data['total'],
            requestedList: rsData[4].data['accounts'],
            totalRequested: rsData[4].data['total'],
            typeFollwerCurrentAccountWithViaAccount:
                rsData[5].data.typeFollower,
            currentAccountId: event.currentAccountId,
            viaAccountId: event.viaAccountId,
            page: 1,
            pageFollwer: 1,
            pageFriend: 1,
            pageRequested: 1,
            isLoadingListAccept: false,
            isLoadingListFriend: false,
            isLoadingListRequested: false,
            hasReachedListAccept: false,
            hasReachedListFriend: false,
            hasReachedListRequested: false,
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
