import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:monitorflutter/app/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class VayPage extends StatefulWidget {
  @override
  _VayPage createState() => _VayPage();
}

final formatMoney = new NumberFormat("#,###");

class _VayPage extends State<VayPage> {
  dynamic list = [];
  void getListVay() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var sid = await pref.getString('sid');
      var url = '${CONSTANT.URL_API}/history/getList';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $sid";
      var response = await dio.post(
        url,
        data: {'type': 'Vay', 'text': ''},
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

  deleteHistory(_id) async {
    try {
      print(_id);
      SharedPreferences pref = await SharedPreferences.getInstance();
      var sid = await pref.getString('sid');
      var url = '${CONSTANT.URL_API}/history/update';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $sid";
      await dio.post(
        url,
        data: {
          '_id': _id.toString(),
          'isActive': false,
        },
      );
      getListVay();
    } on DioError catch (e) {
      var parsedJson = json.decode(e.response.toString());
      if (parsedJson["statusCode"] == 401) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('sid', '');
        Get.offAndToNamed(Routes.LOGIN);
      }
    }
  }

  updateHistory(_id, completed) async {
    try {
      print(!completed);
      SharedPreferences pref = await SharedPreferences.getInstance();
      var sid = await pref.getString('sid');
      var url = '${CONSTANT.URL_API}/history/update';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $sid";
      await dio.post(
        url,
        data: {
          '_id': _id,
          'isActive': true,
          'completed': !completed,
        },
      );
      getListVay();
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
    getListVay();
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
          return GestureDetector(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    elevation: 1,
                    backgroundColor: Color(0xff25404B),
                    child: Container(
                      height: 170,
                      width: 300,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                "${list[index]['partner']}",
                                fontSize: 16,
                                color: Color(0xffa2bac4),
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 10),
                              MyText(
                                formatMoney
                                    .format(list[index]['money'])
                                    .toString(),
                                fontSize: 16,
                                color: list[index]['completed'] == false
                                    ? Color(0xffFF7D7D)
                                    : Color(0xff1FCCB7),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: MyButton(
                                  list[index]['completed'] == false
                                      ? Color(0xff1FCCB7)
                                      : Color(0xff25404B),
                                  borderColor: list[index]['completed'] == false
                                      ? Color(0xff25404B)
                                      : Color(0xff1FCCB7),
                                  height: 40,
                                  radius: 3,
                                  child: MyText(
                                    list[index]['completed'] == false
                                        ? 'Hoàn thành'
                                        : 'Mở lại',
                                    color: list[index]['completed'] == false
                                        ? Colors.white
                                        : Color(0xff1FCCB7),
                                  ),
                                  function: () {
                                    updateHistory(
                                      list[index]['_id'],
                                      list[index]['completed'],
                                    );
                                    Navigator.pop(context, true);
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: MyButton(
                                  Color(0xffFF7D7D),
                                  height: 40,
                                  radius: 3,
                                  child: MyText('Xóa'),
                                  function: () {
                                    deleteHistory(list[index]['_id']);
                                    Navigator.pop(context, true);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
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
