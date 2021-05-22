import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/scaffold_user.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:monitorflutter/app/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  var username = '';
  var vay = 0;
  var chovay = 0;
  final formatMoney = new NumberFormat("#,###");

  @override
  initState() {
    super.initState();
    getProfile();
    getTotalVay();
    getTotalChoVay();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldUser(
      bodyFunction: bodyFunction,
    );
  }

  void getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('name')!;
    });
  }

  void getTotalVay() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var sid = await pref.getString('sid');
      var url = '${CONSTANT.URL_API}/history/getTotal';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $sid";
      var response = await dio.post(url, data: {'type': 'Vay'});
      print(response.toString());
      print('total vay');
      setState(() {
        vay = int.parse(response.toString());
      });
    } catch (e) {
      print(e);
    }
  }

  void getTotalChoVay() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var sid = await pref.getString('sid');
      var url = '${CONSTANT.URL_API}/history/getTotal';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $sid";
      var response = await dio.post(url, data: {'type': 'Cho vay'});
      print(response.toString());
      print('total cho vay');
      setState(() {
        chovay = int.parse(response.toString());
      });
    } catch (e) {
      print(e);
    }
  }

  bodyFunction() {
    print('????');
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyText(
                'Xin chào ',
                color: Color(0xff62808c),
                fontSize: 14,
              ),
              MyText(
                username,
                fontSize: 14,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              MyText(
                'Tổng đang vay: ',
                color: Color(0xff62808c),
                fontSize: 14,
              ),
              MyText(
                formatMoney.format(vay),
                fontSize: 14,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              MyText(
                'Tổng cho vay: ',
                color: Color(0xff62808c),
                fontSize: 14,
              ),
              MyText(
                formatMoney.format(chovay),
                fontSize: 14,
              ),
            ],
          ),
          SizedBox(height: 10),
          MyButton(
            Color(0xff325360),
            height: 30,
            width: 110,
            radius: 50,
            function: () {},
            child: MyText('Đổi mật khẩu'),
          ),
          SizedBox(height: 10),
          MyButton(
            Color(0xff325360),
            height: 30,
            width: 110,
            radius: 50,
            function: () {
              logout();
            },
            child: MyText('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}
