import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodioo/core/helper/dio_sepecificate.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_event.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_state.dart';
import 'package:foodioo/domain/models/user_model.dart';
import 'package:foodioo/domain/view_models/login/login_view_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../domain/service/user_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthUserToken>((event, emit) => _onAuthUserToken(event, emit));
    on<LoginUser>((event, emit) => _onLoginUser(event, emit));
    on<Logout>((event, emit) => _onLogout(event, emit));
    on<RegisterUser>((event, emit) => _onRegisterUser(event, emit));
  }
  _onRegisterUser(RegisterUser event ,   Emitter emit) async {
      try{
              emit(state.copyWith(isLoadingOverLay: true));
      }catch(err)
      {

      }
  }

  _onLoginUser(LoginUser event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoadingOverLay: true));
      ResponseModel data = await UserService().loginUser(event.user);

      if (data.getSuccess) {
        String token = data.data ?? '';
        String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
        await GetStorage().write(keyToken, token);
        FetchClient.token = token;
        List<UserModel> accounts = await UserService().getUser();
        if (accounts.isEmpty) {
          emit(state.copyWith(
              isLoadingOverLay: false,
              isLogout: true,
              message: "No Accounts Found",
              isShowMessage: true,
              token: token));
        } else {
          emit(state.copyWith(
              isLoadingOverLay: false,
              accounts: accounts,
              isLogout: false,
              currentAccount: accounts[0],
              token: token));
        }
      } else {
        emit(state.copyWith(
          isShowMessage: true,
          isLoadingOverLay: false,
          message: data.message,
        ));
      }
    } catch (err) {
      emit(state.copyWith(
        isShowMessage: true,
        isLoadingOverLay: false,
        message: "Lỗi hệ thống ${err.toString()}",
      ));
    }
  }

  _onAuthUserToken(AuthUserToken event, Emitter emit) async {
    try {
      // String themeKey = "ThemeKey";
      String introkey = "IntroKey";
      emit(state.copyWith(isShowSplash: true));
      // await Future.delayed(const Duration(seconds: 3));

      await Future.wait([dotenv.load(fileName: ".env"), GetStorage.init()]);

      String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
      String token = GetStorage().read(keyToken) ?? '';
      FetchClient.token = token;
      bool isShowIntro = GetStorage().read(introkey) ?? true;
      if (isShowIntro) {
        emit(state.copyWith(isShowIntroApp: true));
        GetStorage().write(introkey, false);
      }

      List<UserModel> accounts = [];

      if (token.isNotEmpty) {
        accounts = await UserService().getUser();
      }
      emit(state.copyWith(isShowSplash: false));
      if (accounts.isNotEmpty) {
        emit(state.copyWith(accounts: accounts, currentAccount: accounts[0]));
      } else {
        emit(state.copyWith(isLogout: true));
      }
    } catch (err) {
      emit(state.copyWith(
        isShowMessage: true,
        isLoadingOverLay: false,
        message: "Lỗi hệ thống ${err.toString()}",
      ));
    }
  }

  _onLogout(Logout event, Emitter emit) async {
    try {
      String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
      await GetStorage().write(keyToken, '');
      FetchClient.token = '';
      emit(state
          .copyWith(isLogout: true, currentAccount: null, accounts: const []));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), isShowMessage: true));
    }
  }
}
