import 'package:flutter/material.dart';

class Text_Utils  extends StatelessWidget {

  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color ;
  final bool isUndeLine ;


  const Text_Utils({
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.isUndeLine,
    required this.fontsize,
  Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Text(text,
        style:
            TextStyle(
              color: color,
                fontSize: fontsize,
                fontWeight: fontWeight,
                decoration: isUndeLine ? TextDecoration.underline : TextDecoration.none

        ),
     );
  }
}
