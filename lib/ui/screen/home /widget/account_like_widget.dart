import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';

class AccountLikeWidget extends StatelessWidget {
  const AccountLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthBottomSheet = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(AppConstant.paddingComponent),
      child: Row(
        children: [
          RingOfAvatarWidget(
              sizeAvatar: widthBottomSheet / 9.5,
              ringStyle: RingStyle.normal,
              url:
                  "https://chiemtaimobile.vn/images/companies/1/Ảnh%20Blog/avatar-facebook-dep/Anh-avatar-hoat-hinh-de-thuong-xinh-xan.jpg?1704788263223"),
          SpacingHorizontalWidget(width: widthBottomSheet / 30),
          Text("Đoàn Minh Hiếu", style: Theme.of(context).textTheme.bodyLarge),
          const SpacingHorizontalWidget(),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstant.paddingContent,
                horizontal: AppConstant.radiusMedium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Text("Xem trang",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
