import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';
import 'package:foodioo/ui/general/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/app_bar_create_post_widget.dart';
import 'package:foodioo/ui/screen/create_post/widget/title_bar_widget.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCreatePostWidget(),
            const SpacingVerticalWidget(
              height: 3,
            ),
            const TitleBarWidget(),
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
                  hintText: "Nhập nội dung chia sẻ",
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
