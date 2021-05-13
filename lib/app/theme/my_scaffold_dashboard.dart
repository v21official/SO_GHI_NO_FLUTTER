import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';
import 'package:monitorflutter/app/theme/my_style.dart';
import 'package:monitorflutter/app/theme/my_text.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class MyScaffoldDashboard extends StatelessWidget {
  final Function() bodyFunction;
  final Function()? floatingActionButton;
  final String title;
  final Icon? icon;
  final bool? tabView;
  final bool? bottomView;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'SSL'),
    Tab(text: 'Whois'),
    Tab(text: 'Ping'),
    Tab(text: 'HTTP'),
  ];

  MyScaffoldDashboard(
      {required this.bodyFunction,
      required this.title,
      this.icon,
      this.floatingActionButton,
      this.tabView = false,
      this.bottomView = false});

  @override
  Widget build(BuildContext context) {
    if (tabView == true) {
      return scaffoldWithTabView(context);
    } else if (bottomView == true) {
      return scaffoldWithBottomView(context);
    } else {
      return scaffoldWithTitle(context);
    }
  }

  scaffoldWithTitle(context) {
    return Scaffold(
      appBar: showAppBar(title),
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
              child: bodyFunction() // Main body dynamic
              ),
        ),
      ),
    );
  }

  scaffoldWithTabView(context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: Text(
              title,
              style: styleTextAppBar,
            ),
            backgroundColor: appBarColor,
            bottom: TabBar(
              tabs: myTabs,
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
      ),
    );
  }

  scaffoldWithBottomView(context) {
    return Scaffold(
      appBar: showAppBar(title),
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
              child: bodyFunction() // Main body dynamic
              ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 7.0),
            width: 80,
            height: 80,
            child: FloatingActionButton(
              backgroundColor: Color(0xff1FCCB7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  side: BorderSide(color: Color(0xff25404B), width: 2)),
              onPressed: () {
                floatingActionButton!();
              },
              tooltip: "Dasboard",
              child: Container(
                child: icon,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    //update the bottom app bar view each time an item is clicked
                    onPressed: () {
                      print('clicked thông báo');
                    },
                    icon: iconNotificationNavBar,
                  ),
                  Text(
                    GlobalVariables.TEXT_NOTIFICATION,
                    style: styleTextIconNavBar,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    //update the bottom app bar view each time an item is clicked
                    onPressed: () {
                      print('clicked hỗ trợ');
                    },
                    icon: iconCommentNavBar,
                  ),
                  Text(
                    'khong biet',
                    style: styleTextIconNavBar,
                  )
                ],
              ),
            ],
          ),
        ),
        //color of the BottomAppBar
        color: Color(0xff406775),
      ),
    );
  }

  showAppBar(title) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: MyText(
            title,
            color: Color(0xffA2BAC4),
            fontSize: 19,
          ),
        ),
        backgroundColor: appBarColor,
        leading: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 6),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff406775),
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: IconButton(
              color: Color(0xffA2BAC4),
              onPressed: () {
                print('click home top bar');
                Get.offAndToNamed(Routes.EMPTY_DASHBOARD);
              },
              icon: iconHomeAppBar,
            ),
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                child: IconButton(
                  color: Color(0xffA2BAC4),
                  onPressed: () {
                    print('clicked user ìno');
                  },
                  icon: iconUserAppBar,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
