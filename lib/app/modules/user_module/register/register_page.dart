import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/modules/user_module/register/register_controller.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/scaffold_login.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return MyScaffoldLogin(bodyFunction: bodyFunction);
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  register() async {
    try {
      if (usernameController.text.trim() == '' ||
          passwordController.text.trim() == '' ||
          confirmPasswordController.text.trim() == '' ||
          nameController.text.trim() == '') {
        Fluttertoast.showToast(
          msg: "Vui lòng điền đủ thông tin!",
        );
        return;
      }
      if (passwordController.text.trim().length < 6 ||
          confirmPasswordController.text.trim().length < 6) {
        Fluttertoast.showToast(
          msg: "Mật khẩu phải dài từ 6 kí tự!",
        );
        return;
      }
      if (confirmPasswordController.text.trim() !=
          passwordController.text.trim()) {
        Fluttertoast.showToast(
          msg: "Mật khẩu xác nhận chưa chính xác!",
        );
        return;
      }
      var url = '${CONSTANT.URL_API}/user/register';
      await Dio().post(url, data: {
        'name': nameController.text.trim(),
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim()
      });
      Get.offAndToNamed(Routes.LOGIN,
          arguments: [usernameController.text.trim()]);
    } on DioError catch (e) {
      var parsedJson = json.decode(e.response.toString());
      print(parsedJson);
      Fluttertoast.showToast(
        msg: "Tài khoản đã tồn tại. Vui lòng thử lại!",
      );
    }
  }

  bodyFunction() {
    return SingleChildScrollView(
      child: Container(
        height: 720,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(size: Size(0, 80)),
              MyTextFormField(
                CONSTANT.INPUT_HINT_NAME,
                controller: nameController,
                radius: 100,
                icon: iconFullNameBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                CONSTANT.INPUT_HINT_USERNAME,
                controller: usernameController,
                radius: 100,
                icon: iconUsernameBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                CONSTANT.INPUT_HINT_PASSWORD,
                controller: passwordController,
                radius: 100,
                icon: iconLockBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
                obscureText: true,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                CONSTANT.INPUT_HINT_CONFIRM_PASSWORD,
                controller: confirmPasswordController,
                radius: 100,
                icon: iconLockBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
                obscureText: true,
              ),
              SizedBox.fromSize(size: Size(0, 30)),
              MyButton(
                Color(0xffF5372A),
                radius: 100,
                function: () {
                  register();
                },
                child: MyText(
                  CONSTANT.REGISTER_BUTTON_TEXT,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox.fromSize(
                size: Size(0, 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(CONSTANT.REGISTER_LABEL_EXISTED_REGISTER),
                  SizedBox.fromSize(
                    size: Size(5, 0),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Đăng nhập',
                          style:
                              new TextStyle(color: Colors.yellow, fontSize: 13),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAndToNamed(Routes.LOGIN);
                            },
                        ),
                      ],
                    ),
                  ), //Line how to register
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
