import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../General/image_customize_widget.dart';
import 'intereactive_post_widget.dart';
import 'user_infor_post_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});
  final double heightImageDefault = 300;
  final double paddingTextWithScreen = 9;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthScreen,
      child: Column(
        children: [
          const UserInforPostWidget(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: paddingTextWithScreen),
              width: widthScreen,
              child: Text(
                "Quán mình luôn sẵn cơm miễn phí gọi khi ăn kèm với phở nha! \nPhở bên mình ngon thì là cái ghế tại nó ko phải bàn haha ha",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          Container(
            height: heightImageDefault,
            width: widthScreen,
            color: AppColors.grey50,
            child: CustomImageForLangscope(
              fit: BoxFit.cover,
              url:
                  'https://img-global.cpcdn.com/recipes/cab5d5aa25abd81a/1200x630cq70/photo.jpg',
              height: heightImageDefault,
              width: widthScreen,
            ),
          ),
          const IntereactivePostWidget(),
          _dividerCustomeize(widthScreen)
        ],
      ),
    );
  }

  Widget _dividerCustomeize(double widthScreen) {
    return Container(
      color: AppColors.grey50,
      height: paddingTextWithScreen,
      width: widthScreen,
    );
  }
}
