import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import '../../../General/image_customize_widget.dart';
import '../../../General/spacing_horizontal_widget.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import '../../../General/spacing_vertical_widget.dart';
import 'bottom_modal_sheet_people_around_widget.dart';
import 'setting_button_widget.dart';

class HeaderProfileWidget extends StatefulWidget {
  const HeaderProfileWidget({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<HeaderProfileWidget> createState() => _HeaderProfileWidgetState();
}

class _HeaderProfileWidgetState extends State<HeaderProfileWidget> {
  late ProfileBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<ProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    double radiusAvatar = 80;
    final heightScreen = MediaQuery.sizeOf(context).height;
    final profileHeight = heightScreen * 0.4;
    final fullName = widget.userModel?.fullname ?? "Đàm Vĩnh Hưng";
    String urlAva = widget.userModel?.urlAvatar ?? "";
    String urlBg = widget.userModel?.urlBackgroundProfile ?? "";
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
                  SpacingVerticalWidget(
                    height: profileHeight / 10,
                  ),
                  Text(
                    fullName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SpacingVerticalWidget(
                    height: 6,
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) =>
                        previous.totalFriend != current.totalFriend,
                    builder: (context, state) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (a) => BottomModalSheetPeopleAroundWidget(
                                  bloc: bloc,
                                ));
                      },
                      child: RichText(
                          text: TextSpan(
                              text: state.totalFriend.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: [
                            TextSpan(
                              text: " Bạn bè",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ])),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
