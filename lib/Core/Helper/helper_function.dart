import 'package:flutter/material.dart';
import 'package:time_elapsed/time_elapsed.dart';

removeFocus(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

String convertTimeCreatePost({required String dateCreate}) {
  final customDate = CustomTimeElapsed(
    minutes: 'phút trước',
    hours: 'giờ trước',
    days: 'ngày trước',
    now: 'hiện tại',
    seconds: 'giây trước',
    weeks: 'tuần trước',
  );
  try {
    // DateTime timeDate = DateTime.parse(dateCreate); //
    String dateFormat =
        TimeElapsed.fromDateStr(dateCreate).toCustomTimeElapsed(customDate);
    return dateFormat;
  } catch (err) {
    return "2003";
  }
}
