import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';

class TextfieldCommentsWidget extends StatelessWidget {
  const TextfieldCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Viết bình luận của bạn',
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.paddingHorizontalApp,
                  vertical: AppConstant.paddingComponent),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.grey[600]),
          onPressed: () {},
        ),
      ],
    ); 
  }
}
