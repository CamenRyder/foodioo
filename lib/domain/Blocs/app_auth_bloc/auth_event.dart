import 'package:foodioo/domain/view_models/login/login_view_model.dart';
import '../../view_models/register/register_view_model.dart';

class AuthEvent {
  const AuthEvent();
}

class AuthUserToken extends AuthEvent {}

class RegisterUser extends AuthEvent {
  final RegisterViewModel user;
  RegisterUser({required this.user});
}

class AuthLogin extends AuthEvent {
  final LoginViewModel user;
  AuthLogin({required this.user});
}

class Logout extends AuthEvent {}

class AuthNetworkError extends AuthEvent {}

// class AuthRegister extends AuthEvent {  
//   final ViewModelRegister code;
//   ViewModelRegister({required this.code});
// }