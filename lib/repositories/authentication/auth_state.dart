import '../models/user_model.dart';

class AuthState {
  String token;
  bool isLogout;
  bool isLoadingOverLay;
  bool isShowMessage;
  bool isRegisterSuccess;
  String message;
  bool isDarkMode;
  bool isEnableSound;
  bool isShowSplash;
  bool isShowIntroApp;
  bool isEnableVibration;
  UserModel? currentAccount;
  List<UserModel> accounts;

  AuthState(
      {this.isLogout = false,
      this.isLoadingOverLay = false,
      this.isShowSplash = false,
      this.isEnableSound = false,
      this.isShowMessage = false,
      this.isEnableVibration = false,
      this.isShowIntroApp = false,
      this.isDarkMode = false,
      this.isRegisterSuccess = false,
      this.message = '',
      this.accounts = const [],
      this.token = '',
      this.currentAccount});

  AuthState copyWith({
    bool? isLogout,
    bool? isLoadingOverLay,
    bool? isShowSplash,
    bool? isEnableVibration,
    bool? isShowMessage,
    bool? isRegisterSuccess,
    bool? isDarkMode,
    bool? isEnableSound,
    bool? isShowIntroApp,
    String? message,
    UserModel? currentAccount,
    List<UserModel>? accounts,
    String? token,
  }) {
    return AuthState(
      isLogout: isLogout ?? this.isLogout,
      isShowIntroApp: isShowIntroApp ?? this.isShowIntroApp,
      isEnableSound: isEnableSound ?? this.isEnableSound,
      isLoadingOverLay: isLoadingOverLay ?? false,
      isRegisterSuccess: isRegisterSuccess ?? false,
      isShowMessage: isShowMessage ?? false,
      isEnableVibration: isEnableVibration ?? this.isEnableVibration,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      message: message ?? this.message,
      isShowSplash: isShowSplash ?? this.isShowSplash,
      currentAccount: currentAccount ?? this.currentAccount,
      accounts: accounts ?? this.accounts,
      token: token ?? this.token,
    );
  }
}
