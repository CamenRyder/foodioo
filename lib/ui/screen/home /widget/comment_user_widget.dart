import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/models/comments_model.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/ring_of_avatar_widget.dart';

import '../../../../Core/Helper/helper_function.dart';
import '../../../../Core/routes/routes_name.dart';
import '../../../../repositories/blocs/comment/comment_bloc.dart';
import '../../../../repositories/blocs/comment/comment_event.dart';
import '../../../General/image_customize_widget.dart';
import 'button_more_hori_widget.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel? model;
  const CommentWidget({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    TextStyle styleCustomLocal = TextStyle(
      color: Colors.grey[600],
      fontSize: 12,
    );
    final widthScreen = MediaQuery.sizeOf(context).width;
    final String sender = model?.account?.fullname ?? "Unknown";
    final viaAccountId = model?.account?.id ?? 0;
    final currentAccountId =
        context.read<AuthBloc>().state.currentAccount?.id ?? 0;
    final String message = model?.description ??
        "Bánh mì bò là đồ được làm từ đồ bỏ đi sơ bộ hay chưa kĩ thì suy nghĩ phần mềm người. Có cái là ăn ngon nếu có trứng mẹ nha cả nhà ơi";
    String time = convertTimeCreatePost(dateCreate: model?.createAt ?? "-");
    String baseUrl = AppConstant.baseURL;
    String subDomain = model?.account?.urlAvatar ?? "";
    String subDomainImage = model?.image?.urlImage ?? "";
    String imageComment = baseUrl + subDomainImage;
    if (model?.image?.urlImage == "") {
      imageComment = '';
    }

    final String avatarUrl = baseUrl + subDomain;
    return Padding(
      padding: const EdgeInsets.all(AppConstant.paddingComponent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              url: avatarUrl,
              sizeAvatar: widthScreen / 9,
            ),
          ),
          SizedBox(width: widthScreen / 35),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingVerticalWidget(height: widthScreen / 20 / 2),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sender, style: Theme.of(context).textTheme.bodyLarge),
                    const Expanded(child: SizedBox()),
                    ButtonMoreHoriWidget(
                      commentModel: model,
                      deleteFunction: () => context
                          .read<CommentBloc>()
                          .add(DeteleComment(commentId: model!.id!)),
                    ),
                  ],
                ),
                Text(time, style: styleCustomLocal),
                const SpacingVerticalWidget(height: 3),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                imageComment.isEmpty
                    ? const SizedBox()
                    : CustomImageForLangscope(
                        url: imageComment,
                        height: widthScreen / 1.8,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
