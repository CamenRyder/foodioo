import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
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
    on<ChangeVisibleMode>((event, emit) => _onChangeVisibleMode(event, emit));
    on<ChangeVisibleModeSound>(
        (event, emit) => _onChangeVisibleModeSound(event, emit));
  }

  _onChangeVisibleModeSound(ChangeVisibleModeSound event, Emitter emit) async {
    bool isEnableSound = !state.isEnableSound;

    String keySound = AppConstant.keySoundOnClick;
    await GetStorage().write(keySound, isEnableSound);
    emit(state.copyWith(isEnableSound: isEnableSound));
  }

  _onChangeVisibleMode(ChangeVisibleMode event, Emitter emit) async {
    bool isDarkMode = state.isDarkMode;
    String keyVisibleMode = dotenv.env['KEY_STORAGE'] ?? '';

    await GetStorage().write(keyVisibleMode, !isDarkMode);
    emit(state.copyWith(isDarkMode: !isDarkMode));
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
        String token = data.data['token'] ?? '';
        String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
        String refeshToken = data.data['refesh_token'] ?? '';
        String keyRefeshToken = dotenv.env['KEY_REFESH_TOKEN'] ?? '';

        await Future.wait([
          GetStorage().write(keyToken, token),
          GetStorage().write(keyRefeshToken, refeshToken)
        ]);
        FetchClient.token = token;
        ResponseModel response = await UserService().getUser();
        if (response.getSuccess) {
          List<UserModel> accounts = response.data ?? [];
          if (accounts.isEmpty) {
            emit(state.copyWith(
                isLoadingOverLay: false,
                isLogout: true,
                message: "Không tìm thấy tài khoản.",
                isShowMessage: true,
                token: token));
          } else {
            emit(state.copyWith(
                isLoadingOverLay: false,
                accounts: accounts,
                isShowMessage: true,
                message: "Chào mừng - ${accounts[0].fullname}",
                isLogout: false,
                currentAccount: accounts[0],
                token: token));
          }
        } else {
          emit(state.copyWith(
              isLoadingOverLay: false,
              isLogout: true,
              message: response.message,
              isShowMessage: true,
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
      String introkey = "IntroKey";
      emit(state.copyWith(isShowSplash: true));
      // await Future.delayed(const Duration(seconds: 3));

      await Future.wait([dotenv.load(fileName: ".env"), GetStorage.init()]);

      String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
      String keyVisibleMode = dotenv.env['KEY_STORAGE'] ?? '';
      String keySound = AppConstant.keySoundOnClick;

      String token = GetStorage().read(keyToken) ?? '';
      bool isDarkModeOn = GetStorage().read(keyVisibleMode) ?? false;
      FetchClient.token = token;
      bool isShowIntro = GetStorage().read(introkey) ?? false;
      bool isEnableSound = GetStorage().read(keySound) ?? false;
      if (isShowIntro) {
        emit(state.copyWith(
            isShowIntroApp: true, isDarkMode: false, isEnableSound: false));
        GetStorage().write(introkey, false);
      }

      if (token.isNotEmpty) {
        List<UserModel> accounts = [];
        ResponseModel reponse = await UserService().getUser();
        if (reponse.getSuccess) {
          accounts = reponse.data;
        }
        emit(state.copyWith(isShowSplash: false));
        if (accounts.isNotEmpty) {
          emit(state.copyWith(
              accounts: accounts,
              currentAccount: accounts[0],
              isEnableSound: isEnableSound,
              isDarkMode: isDarkModeOn));
        } else {
          emit(state.copyWith(isLogout: true, isDarkMode: isDarkModeOn));
        }
      } else {
        emit(state.copyWith(
          message: "Hệ thống không phản hồi!!",
          isShowMessage: true,
          isLoadingOverLay: false,
          isShowSplash: false,
        ));
        add(Logout());
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
      String refeshToken = dotenv.env['KEY_REFESH_TOKEN'] ?? '';
      await GetStorage().write(keyToken, '');
      await GetStorage().write(refeshToken, '');
      FetchClient.token = '';
      emit(state.copyWith(
          isLogout: true,
          isShowSplash: false,
          currentAccount: null,
          accounts: const []));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), isShowMessage: true));
    }
  }
}
