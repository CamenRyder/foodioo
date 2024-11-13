import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_event.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(const CreatePostState()) {
    on<InitalLoadingCreatePost>(
        (event, emit) => _onInitalLoadingCreatePost(event, emit));
    on<GetImageDevice>((event, emit) => _onGetImageDevice(event, emit));
    on<RemoveImage>((event, emit) => _onRemoveImage(event, emit));
    on<CreatePost>((event, emit) => _onCreatePost(event, emit));
    on<EnableButtonCreatePost>(
        (event, emit) => _onEnableButtonCreatePost(event, emit));
    on<DisableButtonCreatePost>(
        (event, emit) => _onDisableButtonCreatePost(event, emit));
  }
  _onInitalLoadingCreatePost(InitalLoadingCreatePost event, Emitter emit) {}

  _onEnableButtonCreatePost(EnableButtonCreatePost event, Emitter emit) {
    emit(state.copyWith(enableButtonCreatePost: true));
  }

  _onDisableButtonCreatePost(DisableButtonCreatePost event, Emitter emit) {
    emit(state.copyWith(enableButtonCreatePost: false));
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

  _onCreatePost(CreatePost event, Emitter emit) {}
}
