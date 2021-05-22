import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/modules/history_module/cho_vay/cho_vay_page.dart';
import 'package:monitorflutter/app/modules/history_module/home_controller.dart';
import 'package:monitorflutter/app/modules/history_module/vay/vay_page.dart';
import 'package:monitorflutter/app/theme/my_scaffold.dart';
import 'package:monitorflutter/app/utils/util.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyFunction: bodyFunction,
      title: 'Home',
    );
  }

  bodyFunction() {
    checkAuth();
    setProfile();
    return [
      VayPage(),
      ChoVayPage(),
    ];
  }
}
