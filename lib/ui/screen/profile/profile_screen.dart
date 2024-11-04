import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/core/theme/app_typography.dart';

import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/authentication/auth_event.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28),
      child: ListView(
        children: [
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(Logout());
            },
            child:
                const Text("Đăng xuất", style: AppTypographyDark.textContent),
          )
        ],
      ),
    ));
  }
}
