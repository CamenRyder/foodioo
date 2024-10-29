import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/domain/Blocs/app_Auth_Bloc/auth_event.dart';

import 'package:package_info_plus/package_info_plus.dart';

import 'domain/blocs/app_auth_bloc/auth_bloc.dart';
import 'ui/General/loader_over_lay_widget.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authBloc = AuthBloc();
  authBloc.add(AuthUserToken());

  authBloc.stream.listen((state) {
    runApp(MyApp(authBloc: authBloc));
  });
}

class MyApp extends StatefulWidget {
  final AuthBloc authBloc;
  const MyApp({super.key, required this.authBloc});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(create: (context) => widget.authBloc),
    ], 
    child: LoaderOverLayWidget(child: 
    BlocListener(listener:(context, state) {
      return 
    },) ;  
    MaterialApp(
         title: AppConstant.APP_NAME,
                color: Colors.white,
                // theme: ,
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                home: 
                onGenerateRoute: RouteGenerator.generateRoute,
    ) ));
  }
}
