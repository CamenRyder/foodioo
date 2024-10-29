import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DataLocal{
  Future<void> saveListObject(List<dynamic> listInput, String key) async {
    var result = jsonEncode(listInput);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, result);
  }

  Future<String> getListObject(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(key);
    return result ?? '';
  }
}