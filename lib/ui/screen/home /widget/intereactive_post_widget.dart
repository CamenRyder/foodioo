import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/post_model.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/spacing_horizontal_widget.dart';
import '../../../General/spacing_vertical_widget.dart';
import '../../../General/svg_gen_size_widget.dart';
import 'button_react_widget.dart';
import 'comment_user_widget.dart';

class IntereactivePostWidget extends StatelessWidget {
  const IntereactivePostWidget({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    int totalComment = postModel.totalComment ?? 0;
    int totalLike = postModel.totalLike ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstant.paddingButton),
      child: Row(
        children: [
          Expanded(
              child: ButtonReactWidget(
            totalLike: totalLike,
            postModel: postModel,
          )),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                const radius = Radius.circular(AppConstant.radiusExtra);
                await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      final widthBottomSheet = MediaQuery.sizeOf(context).width;
                      final heighBottomSheet =
                          MediaQuery.sizeOf(context).height * 0.9;
                      const radiusRuler =
                          Radius.circular(AppConstant.paddingContent);
                      return Container(
                        width: widthBottomSheet,
                        height: heighBottomSheet,
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: radius, topRight: radius),
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: Column(
                          children: [
                            SpacingVerticalWidget(
                                height: widthBottomSheet / 25),
                            Container(
                              height: widthBottomSheet / 100,
                              width: widthBottomSheet / 8,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).hintColor,
                                  borderRadius:
                                      const BorderRadius.all(radiusRuler)),
                            ),
                            SpacingVerticalWidget(
                                height: widthBottomSheet / 20),
                            Text("Bình luận ($totalComment)",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            SpacingVerticalWidget(
                                height: widthBottomSheet / 18),
                            Container(
                                width: widthBottomSheet,
                                height: 1,
                                color: Theme.of(context).hintColor),
                            Expanded(
                              child: ListView(
                                children: [
                                  CommentWidget(
                                    sender: "Nguyễn Minh Tuấn",
                                    message:
                                        "An chả này vất lắm, chả quán nhất tầm lắm ạ",
                                    time: "2 ngày trước",
                                    avatarUrl:
                                        "https://images2.thanhnien.vn/528068263637045248/2023/8/15/trinh-van-quyet-16920822359951880696569.jpg",
                                  ),
                                  CommentWidget(
                                    sender: "Cơm mẹ nấu chuẩn",
                                    message:
                                        "Bánh mì bò là đồ được làm từ đồ bỏ đi sơ bộ hay chưa kĩ thì suy nghĩ phần mềm người. Có cái là ăn ngon nếu có trứng mẹ nha cả nhà ơi",
                                    time: "22 tiếng trước",
                                    avatarUrl:
                                        "https://i1.sndcdn.com/artworks-ZZD3NRjNIyr40vEz-rt7qnw-t500x500.jpg",
                                  ),
                                  CommentWidget(
                                    sender: "Đoàn Minh Hiếu",
                                    message:
                                        "An chả này vất lắm, chả quán nhất tầm lắm ạ",
                                    time: "12 phút trước",
                                    avatarUrl:
                                        "https://media.tenor.com/AowE56YGJjQAAAAM/pikachu-surprise.gif",
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border(
                                  top: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstant.paddingComponent,
                                  vertical: AppConstant.paddingComponent),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Viết bình luận công khai',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: AppConstant
                                                    .paddingHorizontalApp,
                                                vertical: AppConstant
                                                    .paddingComponent),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.send,
                                        color: Colors.grey[600]),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgGenSizeWidget(
                    icon: Assets.icons.chat
                        .svg(color: Theme.of(context).hintColor),
                  ),
                  const SpacingHorizontalWidget(
                    width: 12,
                  ),
                  Text(
                    "Bình luận ($totalComment)",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
