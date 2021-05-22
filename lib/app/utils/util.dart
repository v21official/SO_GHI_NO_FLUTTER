import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio dio = new Dio();

void checkAuth() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var sid = await pref.getString('sid');
  if (sid == null || sid == '') {
    Get.offAndToNamed(Routes.LOGIN);
  }
}

void setProfile() async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var sid = await pref.getString('sid');

    var url = '${CONSTANT.URL_API}/user/profile';
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer $sid";
    var response = await dio.get(url);
    var parsedJson = json.decode(response.toString());
    await pref.setString('name', parsedJson['name']);
    await pref.setString('username', parsedJson['username']);
  } catch (e) {
    print(e);
  }
}

void logout() async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Get.offAndToNamed(Routes.LOGIN);
  } catch (e) {
    print(e);
  }
}
