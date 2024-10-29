import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/Blocs/app_Auth_Bloc/auth_event.dart';
import '../../../domain/Blocs/app_Auth_Bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
   
  }
} 