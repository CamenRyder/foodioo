import 'package:image_picker/image_picker.dart';

class CreatePostEvent {}

class InitalLoadingCreatePost extends CreatePostEvent {}

class GetImageDevice extends CreatePostEvent {
  final List<XFile> images;
  GetImageDevice({required this.images});
}

class RemoveImage extends CreatePostEvent {
  final int index;
  RemoveImage({required this.index});
}

class CreatePost extends CreatePostEvent {}
