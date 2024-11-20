import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_event.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/service/user_service.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(userModel: UserModel())) {
    on<InitalLoadingProfile>(
      (event, emit) => _onInitalLoadingProfile,
    );
  }

  UserService userService = UserService();
  PostService postService = PostService();
  _onInitalLoadingProfile(
      InitalLoadingProfile event, Emitter<ProfileState> emit) async {
    try {
      
    } catch (e) {
      emit(state.copyWith(isShowMessages: true, message: e.toString()));
    }
  }
}
