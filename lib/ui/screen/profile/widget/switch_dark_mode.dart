import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/authentication/auth_event.dart';
import '../../../../repositories/authentication/auth_state.dart';

class SwitchDarkMode extends StatelessWidget {
  const SwitchDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Switch(
          value: state.isDarkMode,
          onChanged: (value) {
            context.read<AuthBloc>().add(ChangeVisibleMode());
          },
        );
      },
    );
  }
}
