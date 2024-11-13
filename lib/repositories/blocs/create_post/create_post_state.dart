import 'package:image_picker/image_picker.dart';

class CreatePostState {
  final List<XFile> images;
  final String description;
  final bool isLoadingOverLay;
  final bool isShowMessage;
  final String message;

  const CreatePostState({
    this.images = const [],
    this.description = '',
    this.isLoadingOverLay = false,
    this.isShowMessage = false,
    this.message = '',
  });

  CreatePostState copyWith({
    List<XFile>? images,
    String? description,
    final bool? isLoadingOverLay,
    final bool? isShowMessage,
    final String? message,
  }) {
    return CreatePostState(
        images: images ?? this.images,
        isLoadingOverLay: isLoadingOverLay ?? false,
        isShowMessage: isShowMessage ?? false,
        message: message ?? '',
        description: description ?? this.description);
  }
}
