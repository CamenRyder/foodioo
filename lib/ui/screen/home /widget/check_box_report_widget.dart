import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/models/report_model.dart';
import 'package:foodioo/ui/General/message_over_screen.dart';

import '../../../../repositories/blocs/home/home_event.dart';

class CheckBoxReportWidget extends StatefulWidget {
  const CheckBoxReportWidget({super.key, this.model, this.isTicked = true});
  final ReportModel? model;
  final bool? isTicked;

  @override
  State<CheckBoxReportWidget> createState() => _CheckBoxReportWidgetState();
}

class _CheckBoxReportWidgetState extends State<CheckBoxReportWidget> {
  bool isTicked = false;

  @override
  void initState() { 
    super.initState();
    isTicked = widget.isTicked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppConstant.paddingContent),
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstant.paddingComponent),
      child: CheckboxListTile(
        title: Text(widget.model?.name ?? "  -  "),
        value: isTicked,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool? value) {
          if (widget.isTicked ?? false) {
            MessageToast.showToast(context,
                message: "Đã báo cáo với tiêu đề này");
          } else {
            setState(() {
              isTicked = value ?? false;
              if (value ?? false) {
                context
                    .read<HomeBloc>()
                    .add(PickReport(issueId: widget.model?.id ?? 0));
              } else {
                context
                    .read<HomeBloc>()
                    .add(UnPickReport(issueId: widget.model?.id ?? 0));
              }
            });
          }
        },
      ),
    );
  }
}
