import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/models/report_model.dart';

class CheckBoxReportWidget extends StatefulWidget {
  const CheckBoxReportWidget({super.key, this.model});
  final ReportModel? model;

  @override
  State<CheckBoxReportWidget> createState() => _CheckBoxReportWidgetState();
}

class _CheckBoxReportWidgetState extends State<CheckBoxReportWidget> {
  bool isTicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppConstant.paddingContent),
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstant.paddingComponent),
      child: CheckboxListTile(
        title: Text(widget.model?.name ?? " -  "),
        value: isTicked,
        // checkColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool? value) {
          setState(() {
            isTicked = value ?? false;
          });
        },
      ),
    );
  }
}
