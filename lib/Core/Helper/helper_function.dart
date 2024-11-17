import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:time_elapsed/time_elapsed.dart';

removeFocus(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
//

bool compareTimeWithCurrent({required String token}) {
  try {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token); // parse token
    int timer = decodedToken['exp']; //  detect token
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        timer * 1000); // convert time to dateTime default with now
    DateTime now = DateTime.now();
    bool difference = now.isAfter(dateTime);
    return difference;
  } catch (err) {
    return false;
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
