import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:monitorflutter/app/theme/my_color.dart';

class ScaffoldCreateHistory extends StatelessWidget {
  final Function() bodyFunction;

  ScaffoldCreateHistory({
    required this.bodyFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: appBarColor,
          title: Text('Thêm giao dịch'),
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
                color: Colors.white.withOpacity(0.5),
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                print('add');
              },
              icon: Icon(
                FontAwesome.plus,
                color: Colors.white,
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
    );
  }
}
