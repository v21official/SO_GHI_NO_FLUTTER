import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/scaffold_user.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldUser(
      bodyFunction: bodyFunction,
    );
  }

  bodyFunction() {
    return Text('info');
  }
}
