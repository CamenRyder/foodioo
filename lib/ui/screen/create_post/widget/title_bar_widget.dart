import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../authorizator/widget/ring_of_avatar_widget.dart';
import 'get_image_widget.dart';

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.sizeOf(context).width;
    return Row(children: [
      const SpacingHorizontalWidget(
        width: AppConstant.paddingComponent - 3,
      ),
      RingOfAvatarWidget(
        url:
            "https://suckhoedoisong.qltns.mediacdn.vn/thumb_w/600/Images/hahien/2015/12/31/gsts-nguyen-tran-hien1451555161.jpg",
        ringStyle: RingStyle.normal,
        sizeAvatar: widthScreen / 8.5,
      ),
      const SpacingHorizontalWidget(
        width: AppConstant.paddingComponent,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Đoàn Minh Hiếu",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SpacingHorizontalWidget(
            width: 3,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppConstant.paddingContent,
                    horizontal: AppConstant.paddingContent + 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstant.radiusMedium),
                  color: Theme.of(context).cardColor,
                ),
                child: Center(
                    child: Text("Thêm thẻ",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white))),
              ),
              const SpacingHorizontalWidget(
                width: 3,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppConstant.paddingContent,
                    horizontal: AppConstant.paddingContent + 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstant.radiusMedium),
                  color: Theme.of(context).cardColor,
                ),
                child: Center(
                    child: Text("Chia sẻ vị trí",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white))),
              )
            ],
          )
        ],
      ),
      const SpacingHorizontalWidget(),
      const GetImageWidget(),
      const SpacingHorizontalWidget(
        width: 12,
      ),
    ]);
  }
}
