import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';

import '../../Core/Theme/app_colors.dart';

class DialogConfirm extends StatefulWidget {
  final String content;
  final String textConfirm;
  final String textCancel;
  final VoidCallback func;
  final VoidCallback fucCancel;
  final bool isLoading;
  const DialogConfirm(
      {super.key,
      required this.content,
      required this.textConfirm,
      required this.textCancel,
      required this.func,
      this.isLoading = false,
      required this.fucCancel});

  @override
  State<DialogConfirm> createState() => _DialogConfirmState();
}

class _DialogConfirmState extends State<DialogConfirm> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        title: Text(
          'Thông báo',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(widget.content)
          ],
        ),
        actions: widget.isLoading
            ? [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: SpinKitThreeBounce(
                      color: Theme.of(context).primaryColor,
                      size: AppConstant.sizeIconMedium,
                    ))
              ]
            : [
                CupertinoDialogAction(
                  onPressed: widget.fucCancel,
                  child: Text(
                    widget.textCancel,
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: widget.func,
                  child: Text(
                    widget.textConfirm,
                    style: const TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                )
              ]);
  }
}
