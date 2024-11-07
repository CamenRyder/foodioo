import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/authentication/auth_state.dart';
import 'package:foodioo/ui/screen/authorizator/widget/login_authorizator_page.dart';
import 'package:foodioo/ui/screen/authorizator/widget/register_authorizator_page.dart';
import '../../General/message_over_screen.dart';

class AuthorizatorScreen extends StatefulWidget {
  const AuthorizatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return AuthorizatorScreenState();
  }
}

class AuthorizatorScreenState extends State<AuthorizatorScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.isShowMessage) {
            MessageToast.showToast(
              context,
              message: state.message,
            );
          }
          if (state.isRegisterSuccess) {
            pageController.animateToPage(0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn);
          }
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              LoginAuthorizatorPage(
                pageController: pageController,
              ),
              RegisterAuthorizatorScreen(
                pageController: pageController,
              )
            ],
          );
        },
      ),
    );
  }
}
