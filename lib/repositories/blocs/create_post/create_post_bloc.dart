import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Helper/dio_sepecificate.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_event.dart';
import 'package:foodioo/repositories/blocs/create_post/create_post_state.dart';
import 'package:foodioo/repositories/service/post_service.dart';
import 'package:foodioo/repositories/view/login_vm.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(const CreatePostState()) {
    on<InitalLoadingCreatePost>(
        (event, emit) => _onInitalLoadingCreatePost(event, emit));
    on<GetImageDevice>((event, emit) => _onGetImageDevice(event, emit));
    on<RemoveImage>((event, emit) => _onRemoveImage(event, emit));
    on<CreatePost>((event, emit) => _onCreatePost(event, emit));
    on<InputContentPost>((event, emit) => _onInputContentPost(event, emit));
    on<PickLocation>((event, emit) => _onPickLocation(event, emit));
    on<InputStringSearchLocation>(
        (event, emit) => _onInputStringSearchLocation(event, emit));
    on<SaveLocation>((event, emit) => _onSaveLocation(event, emit));
    on<SearchLocation>((event, emit) => _onSearchLocation(event, emit));
  }
  PostService postService = PostService();

  _onInputStringSearchLocation(InputStringSearchLocation event, Emitter emit) {
    emit(state.copyWith(keySearchLocation: event.key));
  }

  _onSaveLocation(SaveLocation event, Emitter emit) {
    emit(state.copyWith(isPickedLocation: true));
  }

  _onPickLocation(PickLocation event, Emitter emit) {
    emit(state.copyWith(currentLocationPicked: event.locationPicked));
  }

  _onSearchLocation(SearchLocation event, Emitter emit) async {
    emit(state.copyWith(isSearchingLocation: true));
    ResponseModel response = await postService.searchPositionCustomer(
        address: state.keySearchLocation);
    emit(state.copyWith(isSearchingLocation: false, keySearchLocation: ''));
    if (response.getSuccess) {
      final latngg = response.data;
      String latitude = latngg.split(',')[0];
      double latiudeDouble = double.parse(latitude);
      String longitude = latngg.split(',')[1];
      double longitudeDouble = double.parse(longitude);
      LatLng currentLocationPicked = LatLng(latiudeDouble, longitudeDouble);
      emit(state.copyWith(
          currentLocationPicked: currentLocationPicked,
          isSearchSuccesLocation: true,
          isSearchingLocation: false));
    }

    emit(state.copyWith(isSearchingLocation: false));
  }

  Future<LatLng> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    return currentLocation;
  }

  _onInitalLoadingCreatePost(
      InitalLoadingCreatePost event, Emitter emit) async {
    LatLng currentLocation = await _getCurrentLocation();
    emit(state.copyWith(
        currentAccountID: event.currrentAccountId,
        images: [],
        enableButtonCreatePost: false,
        isPickedLocation: false,
        isSearchSuccesLocation: false,
        currentLocationPicked: currentLocation,
        isPosted: false,
        description: ''));
  }

  _onInputContentPost(InputContentPost event, Emitter emit) {
    if (event.description.isEmpty) {
      emit(state.copyWith(enableButtonCreatePost: false, description: ''));
    } else {
      emit(state.copyWith(
          enableButtonCreatePost: true, description: event.description));
    }
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

  _onCreatePost(CreatePost event, Emitter emit) async {
    try {
      if (state.images.length > 4) {
        emit(state.copyWith(
          isShowMessage: true,
          message: "Đăng bài tối đa 4 ảnh!",
        ));
        return;
      }
      emit(state.copyWith(isLoadingOverLay: true));
      String? lat;
      String? lng;
      if (state.isPickedLocation) {
        LatLng currentLocationPicked = state.currentLocationPicked;
        lat = "${currentLocationPicked.latitude}";
        lng = "${currentLocationPicked.longitude}";
      }
      final data = await FetchClient().postData(
          domainApp: 'http://54.169.24.186:9200/',
          path: 'check',
          params: {"content": state.description});
      print(data);

      ResponseModel result = await postService.createPostData(
          description: state.description,
          accountId: state.currentAccountID,
          lat: lat,
          lng: lng,
          imageUrl: state.images.map((e) => e.path).toList());
      if (result.getSuccess) {
        emit(state.copyWith(
            isShowMessage: true,
            message: result.message,
            isPosted: true,
            isLoadingOverLay: false));
      } else {
        emit(state.copyWith(
            isShowMessage: true,
            message: result.message,
            isPosted: false,
            isLoadingOverLay: false));
      }
    } catch (err) {
      emit(state.copyWith(
          isLoadingOverLay: false,
          isShowMessage: true,
          message: err.toString()));
    }
  }
}
