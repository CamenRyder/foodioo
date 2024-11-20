import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/app_typography.dart';

class QuickUploadPost extends StatelessWidget {
  const QuickUploadPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstant.paddingComponent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12, bottom: 3),
                child: Text(
                  "Chia sẻ nhanh",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 3, bottom: 3),
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent,
                      horizontal: AppConstant.paddingComponent),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.circular(AppConstant.radiusMedium)),
                  child: const Text("Đăng",
                      style: AppTypographyLight.textHintBoldWhite),
                ),
              )
            ],
          ),
          TextField(
            maxLines: 2,
            onChanged: (value) {
              // context
              //     .read<CreatePostBloc>()
              //     .add(InputContentPost(description: value));
            },
            style: Theme.of(context).textTheme.bodyLarge, // displaySmall
            decoration: const InputDecoration(
              hintText: "Nhập nội dung chia sẻ",
              filled: true,
              hintStyle: AppTypographyLight.textHintBold,
              contentPadding: EdgeInsets.symmetric(
                  vertical: AppConstant.paddingVerticalApp,
                  horizontal: AppConstant.paddingVerticalApp),
              labelStyle: AppTypographyLight.textContentBold,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Color.fromARGB(255, 234, 234, 234),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppConstant.radiusExtra)),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
