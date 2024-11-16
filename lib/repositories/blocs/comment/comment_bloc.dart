import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/comment/comment_event.dart';
import 'package:foodioo/repositories/blocs/comment/comment_state.dart';
import 'package:foodioo/repositories/service/post_service.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentState()) {
    on<InitialLoaingComments>(
        (event, emit) => _onInitialLoaingComments(event, emit));
  }

  PostService postService = PostService();  

  _onInitialLoaingComments(
      InitialLoaingComments event, Emitter<CommentState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));  

    } catch (e) {
      emit(state.copyWith(
        isShowMessage: true,
        isLoading: false,
        message: e.toString(),
      ));
    }
  }
}
