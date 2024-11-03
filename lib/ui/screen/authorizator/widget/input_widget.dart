import 'package:flutter/material.dart';
import 'package:foodioo/core/theme/app_typography.dart';
import 'package:foodioo/ui/general/spacing_horizontal_widget.dart';

class InputWidget extends StatefulWidget {
  const InputWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.isPasswordTextField = false});
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordTextField;
  final Widget icon;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5), child: widget.icon),
            const SpacingHorizontalWidget(width: 12),
            Expanded(
              child: TextField(
                controller: widget.controller,
                maxLines: 1,
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Theme.of(context).primaryColor,
                style: AppTypographyLight.textContentBold,
                textInputAction: TextInputAction.done,
                decoration: widget.isPasswordTextField
                    ? InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        labelText: widget.hintText)
                    : InputDecoration(
                        labelText: widget.hintText,
                      ),
              ),
            ),
          ],
        ));
  }
}
