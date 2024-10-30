import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodioo/core/helper/dio_sepecificate.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_event.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_state.dart';
import 'package:foodioo/domain/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../domain/service/user_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthUserToken>((event, emit) => _onAuthUserToken(event, emit));
  }

  _onAuthUserToken(AuthUserToken event, Emitter emit) async {
    try {
      emit(state.copyWith(isShowSplash: true));
      await Future.delayed(Duration(seconds: 3));

      await Future.wait([dotenv.load(fileName: ".env"), GetStorage.init()]);

      String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
      String token = GetStorage().read(keyToken) ?? '';
      FetchClient.token = token;
      List<UserModel> accounts = [];

      if (token.isNotEmpty) {
        accounts = await UserService().getUser();
      }
      emit(state.copyWith(isShowSplash: false));
      if (accounts.isNotEmpty) {
        emit(state.copyWith(accounts: accounts, currentAccount: accounts[0]));
      }
    } catch (e) {}
  }

  logout({required Logout event, required Emitter emit}) async {
    try {
      String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
      await GetStorage().write(keyToken, '');
      FetchClient.token = '';
      emit(state.copyWith(
          isLogout: true,
          isShowMessage: true,
          message: "Hết phiên đăng nhập",
          currentAccount: null,
          accounts: const []));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), isShowMessage: true));
    }
  }
}
