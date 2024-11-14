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

class EnableButtonCreatePost extends CreatePostEvent {
  final String description;
  EnableButtonCreatePost({required this.description});
}

class DisableButtonCreatePost extends CreatePostEvent {
  final String description;
  DisableButtonCreatePost({required this.description});
}

class CreatePost extends CreatePostEvent {
  CreatePost();
}
