import '../../models/user_model.dart';

class AuthState {
  String token;
  bool isLogout;
  bool isLoadingOverLay;
  bool isShowMessage;
  String message;
  bool isShowSplash;
  UserModel? currentAccount;
  List<UserModel> accounts;

  AuthState(
      {this.isLogout = false,
      this.isLoadingOverLay = false,
      this.isShowSplash = false,
      this.isShowMessage = false,
      this.message = '',
      this.accounts = const [],
      this.token = '',
      this.currentAccount});

  AuthState copyWith({
    bool? isLogout,
    bool? isLoadingOverLay,
    bool? isShowSplash,
    bool? isShowMessage,
    String? message,
    UserModel? currentAccount,
    List<UserModel>? accounts,
    String? token,
  }) {
    return AuthState(
      isLogout: isLogout ?? false,
      isLoadingOverLay: isLoadingOverLay ?? false,
      isShowMessage: isShowMessage ?? false,
      message: message ?? "",
      isShowSplash: isShowSplash ?? this.isShowSplash,
      currentAccount: currentAccount ?? this.currentAccount,
      accounts: accounts ?? this.accounts,
      token: token ?? this.token,
    );
  }
}
