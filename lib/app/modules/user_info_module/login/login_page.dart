import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitorflutter/app/modules/user_info_module/login/login_controller.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_scaffold_login.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'package:monitorflutter/app/theme/my_style.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';

// ignore: must_be_immutable
class LoginPage extends GetWidget<LoginController> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    print('Login loaded');
    return MyScaffoldLogin(bodyFunction: bodyFunction);
  }

  bodyFunction() {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(size: Size(0, 80)),
              MyTextFormField(
                GlobalVariables.INPUT_HINT_EMAIL,
                icon: iconEmailBlue,
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
              SizedBox.fromSize(size: Size(0, 23)),
              MyButton(
                Color(0xffF5372A),
                function: () {
                  Get.offAndToNamed(Routes.HOME);
                },
                child: MyText(
                  GlobalVariables.TEXT_LOGIN,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox.fromSize(size: Size(0, 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(GlobalVariables.LOGIN_LABEL_NOT_REGISTER,
                      fontSize: 13),
                  SizedBox.fromSize(size: Size(10, 0)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: GlobalVariables.LOGIN_LINK_REGISTER,
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
              ), //Line not register
            ],
          )),
    );
  }
}
