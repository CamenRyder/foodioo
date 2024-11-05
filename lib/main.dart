import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/routes/routes_name.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/ui/screen/authorizator/authorizator_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'repositories/authentication/auth_bloc.dart';
import 'repositories/authentication/auth_event.dart';
import 'repositories/authentication/auth_state.dart';
import 'ui/general/loader_over_lay_widget.dart';
import 'ui/screen/bottom_tabbar/bottom_tabbar_screen.dart';
import 'ui/screen/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authBloc = AuthBloc();
  authBloc.add(AuthUserToken());
  runApp(MyApp(authBloc: authBloc));
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
            return Listener(
                onPointerDown: (_) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.focusedChild?.unfocus();
                  }
                },
                child: const MainApp());
          },
        )));
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        bloc: context.read<AuthBloc>(),
        builder: (context, state) {
          if (state.isLoadingOverLay) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return MaterialApp(
            title: AppConstant.APP_NAME,
            color: Colors.white,
            navigatorKey: navigatorKey,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: state.isShowSplash
                ? const SplashScreen()
                : state.isLogout
                    ? const AuthorizatorScreen()
                    : const BottomTabbarScreen(),
            // initialRoute: NavigatorNames.SPLASH,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
