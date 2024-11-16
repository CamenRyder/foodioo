import 'package:image_picker/image_picker.dart';

class CommentEvent {}

class InitialLoaingComments extends CommentEvent {
  int postId;
  int currentAccounId;

  InitialLoaingComments({required this.currentAccounId, required this.postId});
}

class GetImageFormGalary extends CommentEvent {
  XFile file;
  GetImageFormGalary({required this.file});
}

class RemoveImage extends CommentEvent {}

class FetchedComments extends CommentEvent {
  int page;

  FetchedComments({required this.page});
}

class InputDescription extends CommentEvent {
  String description;

  InputDescription({required this.description});
}

class PostComments extends CommentEvent {}
