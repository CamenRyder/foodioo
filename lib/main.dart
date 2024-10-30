import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_event.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_bloc.dart';
import 'package:foodioo/domain/blocs/app_auth_bloc/auth_state.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'core/routes/routes.dart';
import 'ui/general/loader_over_lay_widget.dart';
import 'ui/screen/splash/splash_screen.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => widget.authBloc),
        ],
        child: LoaderOverLayWidget(
            child: BlocBuilder<AuthBloc, AuthState>(
          bloc: widget.authBloc,
          // buildWhen: (previous, current) {
          //   return previous != current;
          // },
          builder: (context, state) {
            return MaterialApp(
              title: AppConstant.APP_NAME,
              color: Colors.white,
              // theme: ,
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        )));
  }
}
