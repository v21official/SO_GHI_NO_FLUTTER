import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/theme/scaffold_create.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class CreatePage extends StatelessWidget {
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
              MyTextFormField(
                '',
                labelText: 'Tên đối tác',
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Số tiền',
              ),
              SizedBox(
                height: 15,
              ),
              MyTextFormField(
                '',
                labelText: 'Ghi chú',
                maxLines: 2,
              ),
              SizedBox.fromSize(size: Size(0, 30)),
              MyButton(
                buttonSubmitColor,
                function: () {
                  print('added');
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
