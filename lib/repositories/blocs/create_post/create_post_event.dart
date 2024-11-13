import 'dart:io';

class CreatePostEvent {}

class InitalLoadingCreatePost extends CreatePostEvent {}

class UploadImage extends CreatePostEvent {
  final File image;
  UploadImage({required this.image});
}

class CreatePost extends CreatePostEvent {}