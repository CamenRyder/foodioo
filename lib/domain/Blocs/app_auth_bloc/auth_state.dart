import '../../models/user_model.dart';

class AuthState {
  String token;
  bool isLoading;
  bool isLoadingOverLay;
  bool isShowMessage;
  String message;
  bool isShowSplash;
  UserModel? currentUser;
  List<UserModel> user;

  AuthState(
      {this.isLoading = false,
      this.isLoadingOverLay = false,
      this.isShowSplash = false,
      this.isShowMessage = false,
      this.message = '',
      this.user = const [],
      this.token = '',
      this.currentUser});

  AuthState copyWith({
    bool? isLoading,
    bool? isLoadingOverLay,
    bool? isShowSplash,
    bool? isShowMessage,
    String? message,
    UserModel? currentUser,
    List<UserModel>? user,
    String? token,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingOverLay: isLoadingOverLay ?? this.isLoadingOverLay,
      isShowMessage: isShowMessage ?? this.isShowMessage,
      message: message ?? this.message,
      isShowSplash: isShowSplash ?? this.isShowSplash,
      currentUser: currentUser ?? this.currentUser,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
