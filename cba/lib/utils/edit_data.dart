import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> addIssue(Map jsonm) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  List<String>? data = pref.getStringList('issues');
  if (data == null) {
    pref.setStringList('issue', []);
    data = [];
  }
  print([...data, jsonEncode(jsonm)]);
  pref.setStringList('issue', [...data, jsonEncode(jsonm)]);
}

Future<List<Map<String, String>>> getIssue() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var dataList = pref.getStringList('issue');
  if (dataList == null) {
    return [];
  }
  List<Map<String, String>> data = [];
  for (var i in dataList) {
    var k = jsonDecode(i);

    Map<String, String> stringMap = {};
    k.forEach((key, value) => stringMap[key] = value.toString());
    // var j = k as Map<String, String>;
    data = [...data, stringMap];
  }

  return data;
}
