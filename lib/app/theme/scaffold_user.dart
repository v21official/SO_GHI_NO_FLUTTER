import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_text.dart';

class ScaffoldUser extends StatelessWidget {
  final Function() bodyFunction;

  ScaffoldUser({
    required this.bodyFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: appBarColor,
          title: MyText(
            'Thông tin cá nhân',
            fontSize: 18,
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
            height: double.infinity,
            width: double.infinity,
            color: darkThemeBackgroundColor,
            child: bodyFunction(), // Main body dynamic
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Get.offAndToNamed(Routes.HOME);
              },
              icon: Icon(
                FontAwesome.home,
                color: Colors.white.withOpacity(0.5),
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.offAndToNamed(Routes.CREATE);
              },
              icon: Icon(
                FontAwesome.plus,
                color: Colors.white.withOpacity(0.5),
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesome.user_circle_o,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
        color: Color(0xff406775),
      ),
    );
  }
}
