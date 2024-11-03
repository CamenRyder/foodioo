import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodioo/repositories/authentication/auth_event.dart';
import 'package:foodioo/repositories/authentication/auth_state.dart';
import 'package:get_storage/get_storage.dart';

import '../../Core/Helper/dio_sepecificate.dart';
import '../models/user_model.dart';
import '../service/user_service.dart';
import '../view/login_vm.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthUserToken>((event, emit) => _onAuthUserToken(event, emit));
    on<LoginUser>((event, emit) => _onLoginUser(event, emit));
    on<Logout>((event, emit) => _onLogout(event, emit));
    on<RegisterUser>((event, emit) => _onRegisterUser(event, emit));
  }

  _onRegisterUser(RegisterUser event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoadingOverLay: true));
      ResponseModel data = await UserService().registerUser(event.user);
      if (data.getSuccess) {
        emit(state.copyWith(
            isLoadingOverLay: false,
            isShowMessage: true,
            isRegisterSuccess: true,
            message: data.message));
      } else {
        emit(state.copyWith(
          isLoadingOverLay: false,
          isShowMessage: true,
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
          message: data.message,
          isShowMessage: true,
          isLoadingOverLay: false,
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
        message: "Lỗi hệ thống ${err.toString()}",
        isShowMessage: true,
        isLoadingOverLay: false,
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
