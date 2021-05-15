import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_button.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';
import 'package:monitorflutter/app/theme/my_style.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class MyScaffold extends StatelessWidget {
  final Function() bodyFunction;
  final String title;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Vay'),
    Tab(text: 'Cho vay'),
  ];

  MyScaffold({
    required this.bodyFunction,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: appBarColor,
            bottom: TabBar(
              tabs: myTabs,
              indicatorColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            //Ẩn bàn phím nếu chạm vào nơi khác bất kỳ
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: SafeArea(
            child: Container(
                color: darkThemeBackgroundColor,
                child: TabBarView(
                  children: bodyFunction(), // Main body dynamic
                )),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  print('home');
                },
                icon: Icon(
                  FontAwesome.home,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  print('user');
                },
                icon: Icon(
                  FontAwesome.plus,
                  color: Colors.white.withOpacity(0.5),
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  print('user');
                },
                icon: Icon(
                  FontAwesome.user_circle_o,
                  color: Colors.white.withOpacity(0.5),
                  size: 24,
                ),
              ),
            ],
          ),
          color: Color(0xff406775),
        ),
      ),
    );
  }
}
