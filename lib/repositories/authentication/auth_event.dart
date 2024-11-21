import '../view/login_vm.dart';
import '../view/register_vm.dart';

class AuthEvent {}

class AuthUserToken extends AuthEvent {}

class RegisterUser extends AuthEvent {
  final RegisterViewModel user;
  RegisterUser({required this.user});
}

class ChangeVisibleMode extends AuthEvent {
  ChangeVisibleMode();
}

class ChangeEnableVibration extends AuthEvent {
  ChangeEnableVibration();
}


class ChangeVisibleModeSound extends AuthEvent {
  ChangeVisibleModeSound();
}

class LoginUser extends AuthEvent {
  final LoginViewModel user;
  LoginUser({required this.user});
}

class Logout extends AuthEvent {}

class AuthNetworkError extends AuthEvent {}

// class AuthRegister extends AuthEvent {  
//   final ViewModelRegister code;
//   ViewModelRegister({required this.code});
// }