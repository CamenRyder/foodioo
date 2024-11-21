import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import '../../../General/image_customize_widget.dart';
import '../../../General/spacing_horizontal_widget.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'setting_button_widget.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({super.key, this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    double radiusAvatar = 80;
    final heightScreen = MediaQuery.sizeOf(context).height;
    final profileHeight = heightScreen * 0.4;
    final fullName = userModel?.fullname ?? "Đàm Vĩnh Hưng";
    String urlAva = userModel?.urlAvatar ?? "";
    String urlBg = userModel?.urlBackgroundProfile ?? "";
    String avatarUrl = AppConstant.baseURL + urlAva;
    String bgUrl = AppConstant.baseURL + urlBg;

    return Stack(
      children: [
        // BlocBuilder(
        //   builder: (context, state) {
        //     return ;
        //   },
        // ),
        CustomImageForLangscope(
            height: profileHeight * 0.6,
            width: double.infinity,
            fit: BoxFit.cover,
            url: bgUrl),
        const SettingButtonWidget(),
        Container(
          margin:
              EdgeInsets.only(top: profileHeight * 0.6 - profileHeight / 10),
          child: Row(
            children: [
              SpacingHorizontalWidget(
                width: profileHeight / 15,
              ),
              CustomImage(
                url: avatarUrl,
                size: profileHeight / 3,
                radius: radiusAvatar,
              ),
              const SpacingHorizontalWidget(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpacingVerticalWidget(
                    height: 12,
                  ),
                  Text(
                    fullName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SpacingVerticalWidget(
                    height: 3,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "13",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                        TextSpan(
                          text: " Người theo dõi",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ])),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
