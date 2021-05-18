import 'package:flutter/material.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'my_text.dart';

class MyScaffoldLogin extends StatelessWidget {
  final Function() bodyFunction;
  final Widget bgTopRight = Image(
    image: AssetImage(CONSTANT.TOP_BACKGROUND),
  );

  MyScaffoldLogin({required this.bodyFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Color(0xff152C34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                topBackground(),
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [mainBackground(), bodyFunction()],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  topBackground() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                alignment: Alignment.topRight,
                child: Stack(
                  children: [bgTopRight],
                ))
          ],
        ),
        // Center(child: Image.asset(GlobalVariables.LOGO_INET)),
        SizedBox(
          height: 30,
        ),
        MyText(
          CONSTANT.LOGIN_TITLE_SCRREN,
          color: Color(0xff658998),
          fontSize: 20,
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  mainBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage(CONSTANT.MAIN_BACKGROUND),
        fit: BoxFit.fill,
      ),
    );
  }
}
