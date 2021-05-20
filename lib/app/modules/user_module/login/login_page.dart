import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitorflutter/app/modules/user_module/login/login_controller.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/scaffold_login.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    print('Login loaded');
    return MyScaffoldLogin(bodyFunction: bodyFunction(context));
  }

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bodyFunction(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(size: Size(0, 80)),
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
              SizedBox.fromSize(size: Size(0, 23)),
              MyButton(
                Color(0xffF5372A),
                radius: 100,
                function: () {
                  // Get.offAndToNamed(Routes.HOME);
                  print(usernameController.text);
                  print(passwordController.text);
                  void getHttp() async {
                    try {
                      var url = 'http://10.60.1.17:9496/auth/login';
                      var response = await Dio().post(url, data: {
                        'username': usernameController.text,
                        'password': passwordController.text
                      });
                      var parsedJson = json.decode(response.toString());
                      var sid = parsedJson["access_token"];
                      print(sid);
                    } catch (e) {
                      // usernameController.text = '';
                      // passwordController.text = '';
                      Toast.show("Toast plugin app", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      print(e);
                    }
                  }

                  getHttp();
                },
                child: MyText(
                  CONSTANT.TEXT_LOGIN,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox.fromSize(size: Size(0, 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(CONSTANT.LOGIN_LABEL_NOT_REGISTER, fontSize: 13),
                  SizedBox.fromSize(size: Size(10, 0)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: CONSTANT.LOGIN_LINK_REGISTER,
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                              color: Colors.yellow,
                              fontSize: 13,
                            ),
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.REGISTER);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
