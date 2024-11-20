import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/profile/profile_event.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/service/user_service.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(userModel: UserModel())) {
    on<InitalLoadingProfile>(_onInitalLoadingProfile);

  }

  UserService userService = UserService();
  PostService postService = PostService();
  int pageSize = AppConstant.pageSize;

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
            isLoadingScreen: false));
      } else {
        emit(state.copyWith(
            isShowMessages: true,
            message: rsData[0].message,
            isLoadingScreen: false));
      }
    } catch (e) {
      emit(state.copyWith(isShowMessages: true, message: e.toString()));
    }
  }
}
