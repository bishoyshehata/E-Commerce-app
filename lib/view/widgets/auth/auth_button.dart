import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key,
    required this.onpress,
    required this.Text})
      : super(key: key);
  final Function() onpress ;
  final String Text ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpress,
        child:
        Text_Utils(color: Colors.white,
          fontsize:25,
          fontWeight:FontWeight.bold,
          isUndeLine:false,
          text:Text,
        ),

        style: ElevatedButton.styleFrom(
        primary:Get.isDarkMode? pinkClr :mainColor,
        minimumSize: const Size(400, 60),


    )
    );
  }
}
