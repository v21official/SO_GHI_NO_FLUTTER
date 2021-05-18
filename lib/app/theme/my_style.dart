import 'package:flutter/material.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';
import 'my_color.dart';

const TextStyle hintStyleInputDarkTheme = TextStyle(
  color: darkThemeHintStyleInputColor,
  fontSize: 14,
);
const TextStyle labelStyleInputDarkTheme = TextStyle(
  color: darkThemeHintStyleInputColor,
);
const TextStyle darkThemeHelperStyleInput = TextStyle(
  color: darkThemeHintStyleInputColor,
  fontSize: CONSTANT.FONT_SIZE_DEFAULT,
);

// login screen
const TextStyle loginTitle = TextStyle(
  color: Color.fromRGBO(146, 146, 146, 1),
  fontSize: 14,
);
const TextStyle hintStyleInputLogin = TextStyle(
  fontSize: CONSTANT.FONT_SIZE_DEFAULT,
  color: Color.fromRGBO(146, 146, 146, 1),
);
const TextStyle colorWhite_sizeDefault = TextStyle(
  color: Colors.white,
  fontSize: CONSTANT.FONT_SIZE_DEFAULT,
);

// nav bar
const RoundedRectangleBorder btnHomeFloating = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(50.0)),
  side: BorderSide(
    color: Color(0xff25404b),
    width: 2,
  ),
);
const TextStyle styleTextIconNavBar = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 13,
  color: Color(0xffA2BAC4),
);

// app bar
const TextStyle styleTextAppBar = TextStyle(
  color: Color(0xffA2BAC4),
);
