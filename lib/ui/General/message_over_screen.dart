import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodioo/core/theme/app_colors.dart';

enum MessageType {
  success,
  warning,
  error,
}

class MessageToast {
  static showToast(BuildContext context, String message,
      {MessageType type = MessageType.success, int? duration}) {
    FToast fToast = FToast();
    fToast.init(context);

    Future.delayed(Duration.zero, () async {
      fToast.showToast(
        positionedToastBuilder: (context, child) {
          return Positioned(
            // bottom: kBottomNavigationBarHeight + 20,
            width: MediaQuery.of(context).size.width,
            child: child,
          );
        },
        child: SafeArea(
          child: CustomMessage(
            message: message,
            type: type,
            onClose: () {
              fToast.removeCustomToast();
            },
          ),
        ),
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: duration ?? 5),
      );
    });
  }
}

class CustomMessage extends StatefulWidget {
  final String? message;
  final MessageType? type;
  final bool? center;
  final VoidCallback? onClose;
  const CustomMessage(
      {super.key, this.message, this.type, this.center, this.onClose});

  @override
  State<CustomMessage> createState() => _CustomMessage();
}

class _CustomMessage extends State<CustomMessage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColorsLight.primary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    widget.type == MessageType.error
                        ? Icons.error
                        : widget.type == MessageType.warning
                            ? Icons.warning
                            : Icons.check_circle,
                    color: AppColorsLight.primary,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.message!,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    // maxLines: 2,
                    textAlign: widget.center != null && widget.center!
                        ? TextAlign.center
                        : TextAlign.left,
                  ),
                ),
                const SizedBox(width: 12)
              ],
            ),
          )
        ],
      ),
    );
  }
}
