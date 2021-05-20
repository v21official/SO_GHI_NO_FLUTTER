import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/theme/my_text_form_field.dart';
import 'package:monitorflutter/app/theme/scaffold_create.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

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
                  print('====================================');
                  print(selected['name']);
                  print(partnerController.text);
                  print(moneyController.text);
                  print(noteController.text);
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
