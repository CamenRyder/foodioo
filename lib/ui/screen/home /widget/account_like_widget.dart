import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/react_model.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';

class AccountLikeWidget extends StatelessWidget {
  const AccountLikeWidget({super.key, this.model});

  final ReactModel? model;

  @override
  Widget build(BuildContext context) {
    final widthBottomSheet = MediaQuery.sizeOf(context).width;
    String name = model?.account?.fullname ?? "Minh Hiếu";
    String avatarUrl = AppConstant.baseURL;
    avatarUrl += model?.account?.urlAvatar ?? "";
    return GestureDetector(
      onTap: () =>
          MessageToast.showToast(context, message: "Tính năng đang phát triển"),
      child: Container(
        padding: const EdgeInsets.all(AppConstant.paddingComponent),
        child: Row(
          children: [
            SpacingHorizontalWidget(
              width: widthBottomSheet / 35,
            ),
            RingOfAvatarWidget(
                sizeAvatar: widthBottomSheet / 9.5,
                ringStyle: RingStyle.normal,
                url: avatarUrl),
            SpacingHorizontalWidget(width: widthBottomSheet / 30),
            Text(name, style: Theme.of(context).textTheme.bodyLarge),
            const SpacingHorizontalWidget(),
            // Container(
            //   padding: const EdgeInsets.symmetric(
            //       vertical: AppConstant.paddingContent,
            //       horizontal: AppConstant.radiusMedium),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   child: Row(
            //     children: [
            //       Text("Xem trang",
            //           style: Theme.of(context)
            //               .textTheme
            //               .titleSmall!
            //               .copyWith(color: Colors.white)),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
