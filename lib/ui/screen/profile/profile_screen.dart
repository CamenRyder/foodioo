import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';
import 'package:foodioo/ui/screen/home%20/widget/post_widget.dart';

import '../../../Core/Theme/app_typography.dart';
import '../../../Core/Theme/assets.gen.dart';
import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/authentication/auth_event.dart';
import '../../General/image_customize_widget.dart';
import 'widget/button_edit_widget.dart';
import 'widget/header_profile_widget.dart';
import 'widget/post_profile_widget.dart';
import 'widget/quick_upload_post_widget.dart';
import 'widget/setting_button_widget.dart';
import 'widget/switch_dark_mode.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderProfileWidget(),
              const SpacingVerticalWidget(height: 12),
              const ButtonEditWidget(),
              const QuickUploadPost(),
              const PostProfileWidget(),
              // PostWidget(
              //     postModel: PostModel(
              //   totalComment: 10,
              //   totalLike: 10,
              //   description: "Test",
              // ))
            ],
          )),
    ));
  }
}
