import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/modules/user_info_module/forgot_password/forgot_password_controller.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';
import 'package:monitorflutter/app/theme/my_scaffold_login.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class ForgotPasswordPage extends GetWidget<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return MyScaffoldLogin(bodyFunction: bodyFunction);
  }

  bodyFunction() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox.fromSize(size: Size(0, 57)),
            MyTextFormField(
              GlobalVariables.TEXT_EMAIL,
              icon: iconEmailBlue,
              backgroundInput: Colors.white,
              borderColor: Colors.white,
              focusBorderColor: Colors.white,
              textInputColor: textInputModuleLoginColor,
            ),
            SizedBox.fromSize(size: Size(0, 30)),
            MyButton(
              Color(0xffF5372A),
              function: () {
                print('clicked gui yeu cau');
              },
              child: MyText(
                GlobalVariables.FORGOT_PW_BUTTON_SEND,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
