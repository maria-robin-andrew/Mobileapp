import 'package:shared_preferences/shared_preferences.dart';

void saveData(String name, String email, String phoneNo) async {
  SharedPreferences logindetails = await SharedPreferences.getInstance();
  logindetails.setString('name', name);
  logindetails.setString('email', email);
  logindetails.setString('phoneNo', phoneNo);
}

Future<String?> loadData(String id) async {
  SharedPreferences details = await SharedPreferences.getInstance();
  var data = details.getString(id);
  return data;
}

void clearData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
