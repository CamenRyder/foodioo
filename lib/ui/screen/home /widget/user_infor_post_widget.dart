import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/models/post_model.dart';

import '../../../../Core/Helper/helper_function.dart';
import '../../../../Core/routes/routes_name.dart';
import '../../../../repositories/authentication/auth_bloc.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';
import 'button_quick_method_widget.dart';

class UserInforPostWidget extends StatelessWidget {
  UserInforPostWidget({super.key, this.postModel});
  final PostModel? postModel;
  final String urlBase = AppConstant.baseURL;
  @override
  Widget build(BuildContext context) {
    int currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    int viaAccountId = postModel?.accountId ?? 0;
    final widthScreen = MediaQuery.of(context).size.width;
    double spacingComponent = 9;
    String avatar = postModel?.account?.urlAvatar ?? "";
    String name = postModel?.account?.fullname ?? "Foodioo";
    String urlAvatar = urlBase + avatar;
    String dateFormat =
        convertTimeCreatePost(dateCreate: postModel?.createdAt ?? "-");
    // to calculate from DateTime
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.paddingComponent, vertical: 8),
      child: Row(
        children: [
          const SpacingHorizontalWidget(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              if (currentAccountId != viaAccountId) {
                Navigator.pushNamed(context, NavigatorNames.VIA_PROFILE,
                    arguments: {
                      'viaAccountId': viaAccountId,
                    });
              }
            },
            child: RingOfAvatarWidget(
                sizeAvatar: widthScreen / 8.5,
                ringStyle: RingStyle.normal,
                url: urlAvatar),
          ),
          SpacingHorizontalWidget(
            width: spacingComponent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Text(
                dateFormat,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const Spacer(),
          ButtonQuickMethodWidget(
            postModel: postModel,
          ),
          SpacingHorizontalWidget(
            width: spacingComponent,
          ),
        ],
      ),
    );
  }
}
