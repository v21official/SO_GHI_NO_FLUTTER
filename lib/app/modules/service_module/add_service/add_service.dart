import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_scaffold.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class AddServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyFunction: bodyFunction,
      title: CONSTANT.ADD_SERVICE_TITLE,
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
              MyTextFormField(
                '',
                labelText: 'Tên hiển thị',
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Tên miền theo dõi của bạn',
                helperText: 'Vd: inet.vn, google.com, ...',
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Nhập mô tả cho dịch vụ',
                maxLines: null,
              ),
              SizedBox.fromSize(size: Size(0, 30)),
              MyButton(
                buttonSubmitColor,
                function: () {
                  print('service added');
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
