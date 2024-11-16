import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/ring_of_avatar_widget.dart';

class CommentWidget extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final String avatarUrl;

  const CommentWidget({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(AppConstant.paddingComponent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RingOfAvatarWidget(
            url: avatarUrl,
            sizeAvatar: widthScreen / 9,
          ),
          SizedBox(width: widthScreen / 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingVerticalWidget(height: widthScreen / 14 / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sender, style: Theme.of(context).textTheme.bodyLarge),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SpacingVerticalWidget(height: 3),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
