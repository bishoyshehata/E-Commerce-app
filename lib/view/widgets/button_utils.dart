import 'package:flutter/material.dart';

class Button_Utils extends StatelessWidget {
  final Function() onpressed;
  final Color color;
  final Color textColor;
  final double elevation;
  final double textSize;
  final Widget textStyle;

  const Button_Utils({
    required this.textColor,
    required this.textStyle,
    required this.textSize,
    required this.color,
    required this.onpressed,
    required this.elevation,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child:textStyle,
        textColor: textColor,
        onPressed: onpressed
        ,color: color
        ,elevation: elevation
    ,shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
    );
  }
}
