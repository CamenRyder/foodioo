import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/core/theme/app_colors.dart';
import 'package:foodioo/repositories/blocs/systems/system_bloc.dart';
import 'package:foodioo/repositories/blocs/systems/system_state.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/screen/home%20/widget/foodioo_widget.dart';
import 'package:hidable/hidable.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/icon_button_customize.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemBloc, SystemState>(
      buildWhen: (previous, current) =>
          current.scrollController != previous.scrollController,
      builder: (context, state) => appBarWidget(context),
    );
  }

  Widget appBarWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.paddingHorizontalApp, vertical: 8),
      child: Row(
        children: [
          const FoodiooWidget(),
          const SpacingHorizontalWidget(),
          Row(
            children: [
              IconButtonCustomize(
                icon: Assets.icons.locationMarker.svg(color: AppColors.white),
                onTap: () {
                  MessageToast.showToast(context);
                },
              ),
              const SpacingHorizontalWidget(
                width: 15,
              ),
              IconButtonCustomize(
                icon: Assets.icons.template.svg(color: AppColors.white),
                onTap: () {
                  // MessageToast.showToast(context);
                },
              ),
              // IconButtonCustomize(
              //   icon: Assets.icons.creditCard.svg(color: AppColors.white),
              //   onTap: () {
              //     MessageToast.showToast(context);
              //   },
              // ),
            ],
          )
        ],
      ),
    );
  }
}
