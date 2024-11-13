import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Chia sẻ bài viết",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  margin: const EdgeInsets.only(
                      right: AppConstant.paddingContent + 9),
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstant.paddingContent,
                      horizontal: AppConstant.paddingContent + 9),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstant.radiusMedium),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                      child: Text("Đăng",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
