import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';

import '../../../Core/Theme/app_typography.dart';
import '../../../Core/Theme/assets.gen.dart';
import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/authentication/auth_event.dart';
import '../../General/image_customize_widget.dart';
import 'widget/switch_dark_mode.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    final profileHeight = heightScreen * 0.4;
    String urlMrsDamVinhHung =
        'https://static-images.vnncdn.net/files/publish/2023/3/27/batch-dam-vinh-hung-top-9095-1610333661-1012-567.jpeg';
    String urlAvatarDamVinhHung =
        'https://iv1cdn.vnecdn.net/giaitri/images/web/2023/03/21/dam-vinh-hung-toi-se-phoi-bay-khuyet-diem-cua-ban-than-tren--1679409753.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=LfqX8a0Syqy9CtEDu8RUAw';
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Stack(
                children: [
                  CustomImageForLangscope(
                      height: profileHeight * 0.6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      url: urlMrsDamVinhHung),
                 
                ],
              )
              // SizedBox(
              //   height: profileHeight,
              //   width: double.infinity,
              //   child: Stack(
              //     children: [

              //     ],
              //   ),
              // )
            ],
          )),
    ));
  }
}
