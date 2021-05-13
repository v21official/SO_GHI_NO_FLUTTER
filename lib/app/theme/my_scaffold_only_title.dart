import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_style.dart';
import 'package:monitorflutter/app/theme/my_text.dart';

class MyScaffoldOnlyTitle extends StatelessWidget
    implements PreferredSizeWidget {
  final Function() bodyFunction;
  final String title;

  MyScaffoldOnlyTitle({
    required this.bodyFunction,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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

  showAppBar(title) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title,
            color: Color(0xffA2BAC4),
            fontSize: 19,
          ),
        ],
      ),
      backgroundColor: appBarColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(65);
}
