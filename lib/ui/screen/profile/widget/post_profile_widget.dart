import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostProfileWidget extends StatefulWidget {
  const PostProfileWidget({super.key});

  @override
  State<PostProfileWidget> createState() => _PostProfileWidgetState();
}

class _PostProfileWidgetState extends State<PostProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 28, bottom: 5, top: 3),
          child: Text(
            "Bài viết đã chia sẻ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
          ],
        )
      ],
    );
  }
}
