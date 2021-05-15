import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              SizedBox.fromSize(size: Size(0, 80)),
              MyTextFormField(
                GlobalVariables.INPUT_HINT_USERNAME,
                radius: 100,
                icon: iconUsernameBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
              ),
              SizedBox.fromSize(size: Size(0, 11)),
              MyTextFormField(
                GlobalVariables.INPUT_HINT_PASSWORD,
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
                GlobalVariables.INPUT_HINT_CONFIRM_PASSWORD,
                radius: 100,
                icon: iconLockBlue,
                backgroundInput: Colors.white,
                borderColor: Colors.white,
                focusBorderColor: Colors.white,
                textInputColor: textInputModuleLoginColor,
                obscureText: true,
              ),
              SizedBox.fromSize(size: Size(0, 40)),
              MyButton(
                Color(0xffF5372A),
                radius: 100,
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
          )),
    ));
  }
}
