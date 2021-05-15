import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/modules/history_module/cho_vay/cho_vay_page.dart';
import 'package:monitorflutter/app/modules/history_module/vay/vay_page.dart';
import 'package:monitorflutter/app/theme/my_scaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyFunction: bodyFunction,
      title: 'Home',
    );
  }

  bodyFunction() {
    return [
      VayPage(),
      ChoVayPage(),
    ];
  }
}
