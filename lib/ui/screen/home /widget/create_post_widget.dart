import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/routes/routes_name.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/models/user_model.dart';
import 'package:foodioo/ui/screen/app_config.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/svg_gen_size_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key, this.user, this.refresh});
  final UserModel? user;
  final VoidCallback? refresh;
  @override
  Widget build(BuildContext context) {
    String baseUrl = AppConstant.baseURL;
    String subDomain = user?.urlAvatar ?? "";
    String avatarUrl = baseUrl + subDomain;
    return GestureDetector(
      onTap: () async {
        //
        await Navigator.pushNamed(context, NavigatorNames.CREATE_POST);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RingOfAvatarWidget(ringStyle: RingStyle.vip, url: avatarUrl),
              Text(
                "Chia sẻ trải nghiệm của bạn ?",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SvgGenSizeWidget(
                icon: Assets.icons.imagePicker
                    .svg(color: Theme.of(context).hintColor),
                isLargeSize: true,
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
