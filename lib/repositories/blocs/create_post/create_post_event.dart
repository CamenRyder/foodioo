import 'package:image_picker/image_picker.dart';

class CreatePostEvent {}

class InitalLoadingCreatePost extends CreatePostEvent {
  int currrentAccountId;   
  InitalLoadingCreatePost({required this.currrentAccountId});
}

class GetImageDevice extends CreatePostEvent {
  final List<XFile> images;
  GetImageDevice({required this.images});
}

class RemoveImage extends CreatePostEvent {
  final int index;
  RemoveImage({required this.index});
}

class InputContentPost extends CreatePostEvent {
  final String description;
  InputContentPost({required this.description});
}


class CreatePost extends CreatePostEvent {
  CreatePost();
}
