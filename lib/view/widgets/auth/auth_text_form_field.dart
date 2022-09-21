import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/theme/theme.dart';

class Auth_TextFormField extends StatelessWidget {
  final TextEditingController controller ;
  final bool obsecureText ;
  final Function validator ;
  final Widget prefex;
  final Widget suffix;
  final String hintText;
  const Auth_TextFormField({
    required this.controller ,
    required this.obsecureText,
    required this.validator,
    required this.prefex,
    required this.suffix,
    required this.hintText,


    Key? key ,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      obscureText: obsecureText,
      cursorColor: Get.isDarkMode ? Colors.black : pinkClr,
      keyboardType: TextInputType.text,
      validator: (value)=>validator(value),

      decoration: InputDecoration(
        errorStyle:TextStyle(color: Colors.red) ,
        fillColor: Colors.grey.shade200,
        prefixIcon: prefex ,
        suffixIcon: suffix ,
        hintText: hintText,
          filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10)
        ),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
      ),

    );

  }
}
