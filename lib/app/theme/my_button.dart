import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() function;
  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final Color color;

  const MyButton(
    this.color, {
    Key? key,
    required this.function,
    this.width = double.infinity,
    this.height = 48,
    this.radius,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: function,
        child: child,
      ),
    );
  }
}
