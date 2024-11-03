import 'package:flutter/material.dart';

class CustomizeButtonWidget extends StatelessWidget {
  const CustomizeButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isEnable = false});
  final String title;
  final Function onPressed;
  final bool isEnable;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: isEnable
            ? TextButton(onPressed: onPressed(), child: Text(title))
            : TextButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey),
                ),
                child: Text(title)));
  }
}
