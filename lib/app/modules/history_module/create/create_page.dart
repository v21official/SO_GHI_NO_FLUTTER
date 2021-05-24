import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/theme/scaffold_create.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePage createState() => _CreatePage();
}

class _CreatePage extends State<CreatePage> {
  var optionDropdown = [
    {"name": "Vay", "value": "Vay"},
    {"name": "Cho vay", "value": "Cho vay"},
  ];
  var selected;

  TextEditingController partnerController = new TextEditingController();
  TextEditingController moneyController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

  void create() async {
    try {
      if (selected == null ||
          partnerController.text == '' ||
          moneyController.text == '') {
        Fluttertoast.showToast(
          msg: "Vui lòng điền đủ thông tin!",
        );
      } else {
        var url = '${CONSTANT.URL_API}/history';
        SharedPreferences pref = await SharedPreferences.getInstance();
        var sid = await pref.getString('sid');
        Dio dio = new Dio();
        dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers["authorization"] = "Bearer $sid";
        await dio.post(url, data: {
          'type': selected['name'],
          'partner': partnerController.text,
          'money': int.parse(moneyController.text),
          'note': noteController.text
        });
        partnerController.text = '';
        moneyController.text = '';
        noteController.text = '';
        Fluttertoast.showToast(
          msg: "Thành công!",
        );
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Có lỗi",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCreate(
      bodyFunction: bodyFunction,
    );
  }

  bodyFunction() {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(size: Size(0, 20)),
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  color: Colors.transparent,
                  height: 60,
                  child: DropdownButtonFormField(
                    value: selected,
                    dropdownColor: Color(0xff325360),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(color: Color(0xff406775)),
                      ),
                      hintText: 'Loại giao dịch',
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xff658998)),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff658998),
                    ),
                    items: optionDropdown
                        .map((f) => DropdownMenuItem(
                              value: f,
                              child: MyText(
                                f["name"]!,
                                color: darkThemeTextInputColor,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Tên đối tác',
                controller: partnerController,
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Số tiền',
                keyboardType: TextInputType.number,
                controller: moneyController,
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Ghi chú',
                controller: noteController,
                maxLines: 2,
              ),
              SizedBox.fromSize(size: Size(0, 30)),
              MyButton(
                buttonSubmitColor,
                function: () {
                  create();
                },
                child: MyText(
                  CONSTANT.TEXT_CREATE,
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}
