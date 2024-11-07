import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Theme/app_colors.dart';

import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../../repositories/authentication/auth_event.dart';
import '../../../../repositories/authentication/auth_state.dart';

class SwitchDarkMode extends StatelessWidget {
  const SwitchDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        Color primaryColor = Theme.of(context).primaryColor;
        return Switch(
          activeTrackColor: AppColorsDark.background,
          inactiveTrackColor: AppColorsLight.background,
          thumbColor: WidgetStatePropertyAll(primaryColor),
          value: state.isDarkMode,
          trackOutlineColor:
              const WidgetStatePropertyAll(AppColorsLight.textHint),
          onChanged: (value) {
            context.read<AuthBloc>().add(ChangeVisibleMode());
          },
        );
      },
    );
  }
}
