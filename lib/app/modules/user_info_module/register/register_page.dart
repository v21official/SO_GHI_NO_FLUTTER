import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/modules/user_info_module/register/register_controller.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_scaffold_login.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class RegisterPage extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return MyScaffoldLogin(bodyFunction: bodyFunction);
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
              SizedBox.fromSize(size: Size(0, 57)),
              MyTextFormField(
                GlobalVariables.REGISTER_INPUT_FULLNAME,
                icon: iconFullNameBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                GlobalVariables.TEXT_EMAIL,
                icon: iconEmailBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                GlobalVariables.TEXT_PHONE,
                icon: iconPhoneBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                GlobalVariables.INPUT_HINT_PASSWORD,
                icon: iconLockBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
                obscureText: true,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                GlobalVariables.INPUT_HINT_CONFIRM_PASSWORD,
                icon: iconLockBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
                obscureText: true,
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(GlobalVariables.REGISTER_LABEL_README_1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: GlobalVariables.REGISTER_LABEL_README_2,
                              style: new TextStyle(
                                  color: Colors.yellow, fontSize: 13),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  print('haha');
                                },
                            ),
                          ],
                        ),
                      ), //Line chính sách bảo mật
                      MyText(GlobalVariables.REGISTER_LABEL_README_AND),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: GlobalVariables.REGISTER_LABEL_README_3,
                              style: new TextStyle(
                                  color: Colors.yellow, fontSize: 13),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  print('haha');
                                },
                            ),
                          ],
                        ),
                      ), //Line thỏa thuận sử dụng
                      MyText(GlobalVariables.REGISTER_LABEL_README_4),
                    ],
                  ),
                ],
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              MyButton(
                Color(0xffF5372A),
                function: () {
                  print('clicked register');
                },
                child: MyText(
                  GlobalVariables.REGISTER_BUTTON_TEXT,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox.fromSize(
                size: Size(0, 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(GlobalVariables.REGISTER_LABEL_EXISTED_REGISTER),
                  SizedBox.fromSize(
                    size: Size(5, 0),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: GlobalVariables.TEXT_LOGIN,
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
          )),
    ));
  }
}
