import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import '../../../General/image_customize_widget.dart';
import '../../../General/spacing_horizontal_widget.dart';
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
    
    String urlMrsDamVinhHung = 
        'https://static-images.vnncdn.net/files/publish/2023/3/27/batch-dam-vinh-hung-top-9095-1610333661-1012-567.jpeg';
    String urlAvatarDamVinhHung =
        'https://iv1cdn.vnecdn.net/giaitri/images/web/2023/03/21/dam-vinh-hung-toi-se-phoi-bay-khuyet-diem-cua-ban-than-tren--1679409753.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=LfqX8a0Syqy9CtEDu8RUAw';
    return Stack(
      children: [
        CustomImageForLangscope(
            height: profileHeight * 0.6,
            width: double.infinity,
            fit: BoxFit.cover,
            url: urlMrsDamVinhHung),
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
                url: urlAvatarDamVinhHung,
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
                    "Đoàn Minh Hiếu",
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
