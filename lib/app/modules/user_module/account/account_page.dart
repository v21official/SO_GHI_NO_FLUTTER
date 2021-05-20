import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/scaffold_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldUser(
      bodyFunction: bodyFunction,
    );
  }

  var username;

  void getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('sid');
    });
  }

  bodyFunction() {
    getProfile();
    return Text(username ?? '');
  }
}
