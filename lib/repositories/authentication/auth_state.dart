
import '../models/user_model.dart';

class AuthState {
  String token;
  bool isLogout;
  bool isLoadingOverLay;
  bool isShowMessage;
  String message;
  bool isShowSplash;
  bool isShowIntroApp;
  UserModel? currentAccount;
  List<UserModel> accounts;

  AuthState(
      {this.isLogout = false,
      this.isLoadingOverLay = false,
      this.isShowSplash = false,
      this.isShowMessage = false,
      this.isShowIntroApp = false,
      this.message = '',
      this.accounts = const [],
      this.token = '',
      this.currentAccount});

  AuthState copyWith({
    bool? isLogout,
    bool? isLoadingOverLay,
    bool? isShowSplash,
    bool? isShowMessage,
    bool? isShowIntroApp,
    String? message,
    UserModel? currentAccount,
    List<UserModel>? accounts,
    String? token,
  }) {
    return AuthState(
      isLogout: isLogout ?? this.isLogout,
      isShowIntroApp: isShowIntroApp ?? this.isShowIntroApp,
      isLoadingOverLay: isLoadingOverLay ?? false,
      isShowMessage: isShowMessage ?? false,
      message: message ?? this.message,
      isShowSplash: isShowSplash ?? this.isShowSplash,
      currentAccount: currentAccount ?? this.currentAccount,
      accounts: accounts ?? this.accounts,
      token: token ?? this.token,
    );
  }
}
