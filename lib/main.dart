import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'repositories/authentication/auth_bloc.dart';
import 'repositories/authentication/auth_event.dart';
import 'ui/screen/app_config.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authBloc = AuthBloc();
  authBloc.add(AuthUserToken());
  runApp(MyApp(authBloc: authBloc));
}
