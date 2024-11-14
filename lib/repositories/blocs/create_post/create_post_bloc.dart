import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_event.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_state.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/view/login_vm.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(const CreatePostState()) {
    on<InitalLoadingCreatePost>(
        (event, emit) => _onInitalLoadingCreatePost(event, emit));
    on<GetImageDevice>((event, emit) => _onGetImageDevice(event, emit));
    on<RemoveImage>((event, emit) => _onRemoveImage(event, emit));
    on<CreatePost>((event, emit) => _onCreatePost(event, emit));
    on<InputContentPost>((event, emit) => _onInputContentPost(event, emit));
  }
  PostService postService = PostService();
  _onInitalLoadingCreatePost(InitalLoadingCreatePost event, Emitter emit) {
    emit(state.copyWith(
        currentAccountID: event.currrentAccountId,
        images: [],
        enableButtonCreatePost: false,
        isPosted: false,
        description: ''));
  }

  _onInputContentPost(InputContentPost event, Emitter emit) {
    if (event.description.isEmpty) {
      emit(state.copyWith(enableButtonCreatePost: false, description: ''));
    } else {
      emit(state.copyWith(
          enableButtonCreatePost: true, description: event.description));
    }
  }

  _onGetImageDevice(GetImageDevice event, Emitter emit) {
    if (event.images.isEmpty) return;
    emit(state.copyWith(images: [...state.images, ...event.images]));
  }

  _onRemoveImage(RemoveImage event, Emitter emit) {
    final currentImagesState = state.images;
    currentImagesState.removeAt(event.index);
    emit(state.copyWith(images: currentImagesState));
  }

  _onCreatePost(CreatePost event, Emitter emit) async {
    try {
      if (state.images.length > 4) {
        emit(state.copyWith(
          isShowMessage: true,
          message: "Đăng bài tối đa 4 ảnh!",
        ));
        return;
      }
      emit(state.copyWith(isLoadingOverLay: true));
      ResponseModel result = await postService.createPostData(
          description: state.description,
          accountId: state.currentAccountID,
          imageUrl: state.images.map((e) => e.path).toList());
      if (result.getSuccess) {
        emit(state.copyWith(
            isShowMessage: true,
            message: result.message,
            isPosted: true,
            isLoadingOverLay: false));
      } else {
        emit(state.copyWith(
            isShowMessage: true,
            message: result.message,
            isPosted: false,
            isLoadingOverLay: false));
      }
    } catch (err) {
      emit(state.copyWith(
          isLoadingOverLay: false,
          isShowMessage: true,
          message: err.toString()));
    }
  }
}
