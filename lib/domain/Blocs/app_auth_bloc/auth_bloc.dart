import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodioo/core/helper/dio_sepecificate.dart';
import 'package:get_storage/get_storage.dart';

import '../../../domain/Blocs/app_Auth_Bloc/auth_event.dart';
import '../../../domain/Blocs/app_Auth_Bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthUserToken>(_onAuthUserToken);
  }

  _onAuthUserToken(AuthUserToken event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isShowSplash: true));

    await Future.wait([dotenv.load(fileName: ".env"), GetStorage.init()]);
    String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
    String token = GetStorage().read(keyToken) ?? '';
    FetchClient.token = token;
    if(token.isNotEmpty) {
      
    }
  }
}
