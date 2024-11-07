import 'package:flutter/material.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:foodioo/core/theme/app_typography.dart';
import 'package:foodioo/ui/general/spacing_horizontal_widget.dart';
import 'package:foodioo/ui/screen/authorizator/widget/bottom_sheet_select_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/assets.gen.dart';
import '../../../general/svg_gen_size_widget.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<SelectGenderWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<SelectGenderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).primaryColor;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SvgGenSizeWidget(
                    icon: Assets.icons.heart.svg(color: iconColor))),
            const SpacingHorizontalWidget(width: 12),
            Expanded(
              child: TextField(
                  controller: widget.controller,
                  maxLines: 1,
                  readOnly: true,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Theme.of(context).primaryColor,
                  style: AppTypographyLight.textContentBold,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            final value = await showModalBottomSheet(
                                isScrollControlled: false,
                                context: context,
                                builder: (context) =>
                                    const BottomSheetSelectWidget());
                            if (value != null) {
                              setState(() {
                                widget.controller.text =
                                    value == 1 ? "Nam" : "Nữ";
                              });
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Theme.of(context).hintColor,
                          )),
                      labelText: "Giới tính")),
            ),
          ],
        ));
  }
}
