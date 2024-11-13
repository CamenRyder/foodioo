import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/Core/theme/app_colors.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/ring_of_avatar_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/app_bar_create_post_widget.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCreatePostWidget(),
            Row(children: [
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
                          borderRadius:
                              BorderRadius.circular(AppConstant.radiusMedium),
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
                          borderRadius:
                              BorderRadius.circular(AppConstant.radiusMedium),
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
              GestureDetector(
                onTap: () async {
                  final a = await ImagePicker().pickMultiImage();
                },
                child: SvgGenSizeWidget(
                  icon: Assets.icons.imagePicker.svg(),
                  isLargeSize: true,
                ),
              ),
              const SpacingHorizontalWidget(
                width: 12,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstant.paddingVerticalApp,
                  horizontal: AppConstant.paddingVerticalApp),
              child: TextField(
                maxLines: 5,
                // controller: textEdt02,
                onChanged: (value) {
                  // textEdt01.text != "" && textEdt02.text != ""
                  //     ? ref
                  //         .read(blurNotifierProvider.notifier)
                  //         .enableBlurButton()
                  //     : ref
                  //         .read(blurNotifierProvider.notifier)
                  //         .disableBlurButton();
                },
                // autofocus: false,
                style: Theme.of(context).textTheme.bodyLarge, // displaySmall
                decoration: const InputDecoration(
                  hintText: "Tên Chính",
                  filled: true,
                  hintStyle: AppTypographyLight.textHintBold,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent,
                      horizontal: AppConstant.paddingVerticalApp),
                  labelStyle: AppTypographyLight.textContentBold,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Color.fromARGB(255, 218, 218, 218),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstant.radiusExtra)),
                      borderSide: BorderSide.none),
                  label: Text("Tên Chính"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
