import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_event.dart';
import 'package:foodioo/repositories/blocs/systems/system_event.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../Core/Constants/constant_stataue.dart';
import '../../Core/Theme/app_theme.dart';
import '../../Core/routes/routes.dart';
import '../../main.dart';
import '../../repositories/authentication/auth_bloc.dart';
import '../../repositories/authentication/auth_state.dart';
import '../../repositories/blocs/comment/comment_bloc.dart';
import '../../repositories/blocs/create_post/create_post_bloc.dart';
import '../../repositories/blocs/systems/system_bloc.dart';
import '../General/loader_over_lay_widget.dart';
import 'authorizator/authorizator_screen.dart';
import 'bottom_tabbar/bottom_tabbar_screen.dart';
import 'splash/splash_screen.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) {
        return current.isShowSplash != previous.isShowSplash ||
            current.isLogout != previous.isLogout;
      },
      builder: (context, state) {
        return state.isShowSplash
            ? const SplashScreen()
            : state.isLogout
                ? const AuthorizatorScreen()
                : const BottomTabbarScreen();
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        bloc: context.read<AuthBloc>(),
        buildWhen: (previous, current) {
          return current.isLoadingOverLay != previous.isLoadingOverLay ||
              current.isDarkMode != previous.isDarkMode;
        },
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
            theme: state.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: const AppConfig(),
            // initialRoute: NavigatorNames.SPLASH,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
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
          BlocProvider<SystemBloc>(create: (context) {
            final systemBloc = SystemBloc();
            systemBloc.add(InitialSystem());
            return systemBloc;
          }),
          BlocProvider(create: (context) => CreatePostBloc()),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
       
        ],
        child: LoaderOverLayWidget(
            child: Listener(
                onPointerDown: (_) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.focusedChild?.unfocus();
                  }
                },
                child: const MainApp())));
  }
}
