import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitorflutter/app/theme/my_color.dart';
import 'package:monitorflutter/app/theme/my_style.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
    this.hintText, {
    Key? key,
    this.focusNode,
    this.labelText,
    this.labelStyle = labelStyleInputDarkTheme,
    this.helperText,
    this.helperStyle = darkThemeHelperStyleInput,
    this.backgroundInput = Colors.transparent,
    this.borderColor = darkThemeBorderInputColor,
    this.focusBorderColor = darkThemeFocusBorderInputColor,
    this.textInputColor = darkThemeTextInputColor,
    this.keyboardType = TextInputType.text,
    this.radius = 6,
    this.height = 60,
    this.maxLines = 1,
    this.hintStyle = hintStyleInputLogin,
    this.icon,
    this.onTap,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  final FocusNode? focusNode;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final Color? backgroundInput;
  final Color borderColor;
  final Color focusBorderColor;
  final Color textInputColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double radius;
  final double? height;
  final Icon? icon;
  final Function? onTap;
  final TextEditingController? controller;
  final bool obscureText; // password: string => ***

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          color: backgroundInput,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: TextFormField(
              onTap: () => onTap,
              controller: controller,
              focusNode: focusNode,
              obscureText: obscureText,
              maxLines: maxLines,
              keyboardType: keyboardType,
              cursorColor: Color(0xff658998),
              style: TextStyle(color: textInputColor),
              decoration: InputDecoration(
                helperText: helperText,
                helperStyle: helperStyle,
                labelText: labelText,
                labelStyle: labelStyle,
                prefixIcon: icon,
                hintText: hintText,
                hintStyle: hintStyle,
                // border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: focusBorderColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
