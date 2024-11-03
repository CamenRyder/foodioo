import 'package:flutter/material.dart';

removeFocus(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

String showErorrResponse(int code) {
  String errorMessage = "";
  switch (code) {
    case 40900:
      errorMessage = "Tai khoản đã tồn tại!";
      break;
    case 40901:
      errorMessage = "Email đã tồn tại!";  
    case 40105:
      errorMessage = "Mật khẩu không chính xác!";
      break;
    case 40104:
      errorMessage = "Tài khoản không tồn tại!";
      break;
    default:
      errorMessage = "Lỗi hệ thống";
      break;
  }
  return errorMessage;
}
