import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/app_theme.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/core/theme/app_colors.dart';
import 'package:foodioo/ui/General/spacing_horizontal_widget.dart';

class MessageToast {
  static showToast(BuildContext context, String message, {int? duration}) {
    FToast fToast = FToast();
    fToast.init(context);

    Future.delayed(Duration.zero, () async {
      fToast.showToast(
        positionedToastBuilder: (context, child) {
          return Positioned(
            width: MediaQuery.of(context).size.width,
            child: child,
          );
        },
        child: SafeArea(
          child: CustomMessage(
            message: message,
          ),
        ),
        gravity: ToastGravity.TOP_RIGHT,
        toastDuration: Duration(seconds: duration ?? 2),
      );
    });
  }
}

class CustomMessage extends StatefulWidget {
  final String? message;
  final bool? center;
  const CustomMessage({super.key, this.message, this.center});

  @override
  State<CustomMessage> createState() => _CustomMessage();
}

class _CustomMessage extends State<CustomMessage> {
  @override
  void initState() {
    super.initState();
  }

  final double paddingVertical = 20;
  final double paddingTop = 10;
  final double paddingTextWithIcon = 16;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingVertical, right: paddingVertical, top: paddingTop),
      child: Container(
        padding: const EdgeInsets.all(AppConstant.paddingHorizontalApp),
        decoration: BoxDecoration(
            color: AppColorsLight.background,
            borderRadius: BorderRadius.circular(AppConstant.radiusMedium),
            boxShadow: AppTheme.shadowLight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: paddingTextWithIcon),
              child: Assets.avatar.appAvatar.image(
                  height: AppConstant.sizeIconLarge,
                  width: AppConstant.sizeIconLarge),
            ),
            Expanded(
              child: Text(
                widget.message!,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                    color: AppColorsLight.textContent,
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstant.textSizeTitle),
                textAlign: widget.center != null && widget.center!
                    ? TextAlign.center
                    : TextAlign.left,
              ),
            ),
            const SpacingHorizontalWidget(width: 12)
          ],
        ),
      ),
    );
  }
}
