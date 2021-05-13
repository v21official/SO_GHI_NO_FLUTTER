import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    Key? key,
    this.color = Colors.white,
    this.fontSize = GlobalVariables.FONT_SIZE_DEFAULT,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.quicksand(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        )
        // style: TextStyle(
        //   color: color,
        //   fontSize: fontSize,
        //   fontWeight: fontWeight,
        // ),
        );
  }
}
