import '../models/user_model.dart';

class AuthState {
  String token;
  bool isLogout;
  bool isLoadingOverLay;
  bool isShowMessage;
  bool isRegisterSuccess;
  String message;
  bool isDarkMode;  
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
      this.isDarkMode = false ,  
      this.isRegisterSuccess = false,
      this.message = '',
      this.accounts = const [],
      this.token = '',
      this.currentAccount});

  AuthState copyWith({
    bool? isLogout,
    bool? isLoadingOverLay,
    bool? isShowSplash,
    bool? isShowMessage,
    bool? isRegisterSuccess,
    bool? isDarkMode ,  
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
      isRegisterSuccess: isRegisterSuccess ?? false,
      isShowMessage: isShowMessage ?? false,
      isDarkMode: isDarkMode ?? this.isDarkMode ,
      message: message ?? this.message,
      isShowSplash: isShowSplash ?? this.isShowSplash,
      currentAccount: currentAccount ?? this.currentAccount,
      accounts: accounts ?? this.accounts,
      token: token ?? this.token,
    );
  }
}
