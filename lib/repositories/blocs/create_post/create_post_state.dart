import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostState {
  final List<XFile> images;
  final int currentAccountID;
  final String keySearchLocation;
  final LatLng currentLocationPicked;
  final bool isSearchingLocation;
  final bool isSearchSuccesLocation;
  final String description;
  final bool isPosted; // for success upload post
  final bool isLoadingOverLay;
  final bool enableButtonCreatePost;
  final bool isShowMessage;
  final String message;

  const CreatePostState({
    this.images = const [],
    this.description = '',
    this.isSearchSuccesLocation = false,
    this.keySearchLocation = '',
    this.isSearchingLocation = false,
    this.currentLocationPicked = const LatLng(0, 0),
    this.isLoadingOverLay = false,
    this.currentAccountID = 0,
    this.isShowMessage = false,
    this.message = '',
    this.enableButtonCreatePost = false,
    this.isPosted = false,
  });

  CreatePostState copyWith({
    List<XFile>? images,
    String? description,
    int? currentAccountID,
    String? keySearchLocation,
    LatLng? currentLocationPicked,
    bool? isSearchingLocation,
    bool? isSearchSuccesLocation,
    bool? isPosted,
    final bool? isLoadingOverLay,
    final bool? enableButtonCreatePost,
    final bool? isShowMessage,
    final String? message,
  }) {
    return CreatePostState(
        isPosted: isPosted ?? this.isPosted,
        images: images ?? this.images,
        isLoadingOverLay: isLoadingOverLay ?? false,
        keySearchLocation: keySearchLocation ?? this.keySearchLocation,
        currentLocationPicked: currentLocationPicked ?? this.currentLocationPicked,
        isSearchSuccesLocation:
            isSearchSuccesLocation ?? this.isSearchSuccesLocation,
        isSearchingLocation: isSearchingLocation ?? this.isSearchingLocation,
        isShowMessage: isShowMessage ?? false,
        currentAccountID: currentAccountID ?? this.currentAccountID,
        enableButtonCreatePost:
            enableButtonCreatePost ?? this.enableButtonCreatePost,
        message: message ?? '',
        description: description ?? this.description);
  }
}
