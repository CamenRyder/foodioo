import 'package:image_picker/image_picker.dart';

class CreatePostState {
  final List<XFile> images;
  final int currentAccountID;
  final String description;
  final bool isLoadingOverLay;
  final bool enableButtonCreatePost;
  final bool isShowMessage;
  final String message;

  const CreatePostState({
    this.images = const [],
    this.description = '',
    this.isLoadingOverLay = false,
    this.currentAccountID = 0 ,
    this.isShowMessage = false,
    this.message = '',
    this.enableButtonCreatePost = false,
  });

  CreatePostState copyWith({
    List<XFile>? images,
    String? description,
    int? currentAccountID,
    final bool? isLoadingOverLay,
    final bool? enableButtonCreatePost,
    final bool? isShowMessage,
    final String? message,
  }) {
    return CreatePostState(
        images: images ?? this.images,
        isLoadingOverLay: isLoadingOverLay ?? false,
        isShowMessage: isShowMessage ?? false,
        currentAccountID: currentAccountID ?? this.currentAccountID,
        enableButtonCreatePost: enableButtonCreatePost ?? false,
        message: message ?? '',
        description: description ?? this.description);
  }
}
