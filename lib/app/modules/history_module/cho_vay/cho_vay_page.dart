import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:monitorflutter/app/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ChoVayPage extends StatefulWidget {
  @override
  _ChoVayPage createState() => _ChoVayPage();
}

final formatMoney = new NumberFormat("#,###");

class _ChoVayPage extends State<ChoVayPage> {
  dynamic list = [];
  void getListChoVay() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var sid = await pref.getString('sid');
      var url = '${CONSTANT.URL_API}/history/getList';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $sid";
      var response = await dio.post(
        url,
        data: {'type': 'Cho vay', 'text': ''},
      );
      setState(() {
        list = response.data;
      });
    } on DioError catch (e) {
      var parsedJson = json.decode(e.response.toString());
      if (parsedJson["statusCode"] == 401) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('sid', '');
        Get.offAndToNamed(Routes.LOGIN);
      }
    }
  }

  @override
  initState() {
    super.initState();
    getListChoVay();
  }

  @override
  Widget build(BuildContext context) {
    if (list.length == 0) {
      return Center(
          child: MyText(
        'Chưa có giao dịch nào',
        fontSize: 16,
        color: Color(0xff658998),
      ));
    }
    return Container(
      padding: EdgeInsets.only(top: 1, bottom: 1),
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Color(0xff2c4a55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      '${list[index]['partner']}',
                      fontSize: 16,
                      color: Color(0xffa2bac4),
                    ),
                    MyText(
                      formatMoney.format(list[index]['money']).toString(),
                      fontSize: 16,
                      color: list[index]['completed'] == false
                          ? Color(0xffFF7D7D)
                          : Color(0xff1FCCB7),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                MyText(
                  '${list[index]['note']}',
                  color: Color(0xff5c7f8e),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1);
        },
      ),
    );
  }
}
