import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/auth_controller.dart';
import 'package:my_e_commerce/view/widgets/auth/auth_button.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../../theme/theme.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class Forget_Password extends StatelessWidget {
   Forget_Password({Key ? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final mailController = TextEditingController();

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          backgroundColor:Get.isDarkMode? darkGreyClr : Colors.white,
        appBar: AppBar(
          backgroundColor:Get.isDarkMode? darkGreyClr : mainColor,

          title: Center(
            child: Text_Utils(
              text: "Forget Password",
              color: Get.isDarkMode? pinkClr  : Colors.white,
              isUndeLine: false,
              fontWeight: FontWeight.normal,
              fontsize: 30,
            ),
          ),
        ),

        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.close_rounded,size: 30,color: Get.isDarkMode?Colors.white:Colors.black,
                        ),
                      ),
                  ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "if you want to recover your account ,then please provide your email ID below...",textAlign: TextAlign.center,
                     style: TextStyle(
                         color: Get.isDarkMode?Colors.black:Colors.white,
                       fontSize: 18,
                     ),
                  ),
                  Image.asset("images/forgetpass copy.png"),
                  SizedBox(height: 30,),
                  Auth_TextFormField(controller: mailController,
                    obsecureText: false,
                    validator: (value){
                      if(!RegExp(validationEmail).hasMatch(value)){
                        return "Invalid e-mail" ;
                      }    else
                      {
                        return null ;
                      }

                    },
                    prefex: Icon(Icons.mail,size: 30,color: Get.isDarkMode?pinkClr  : mainColor,),
                    suffix: Text(""),
                    hintText: "E-Mail",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GetBuilder<AuthController>(builder: (_){
                    return AuthButton(
                      onpress: (){
                        if(_formkey.currentState!.validate()){
                          String mail = mailController.text.trim();
                          controller.resetPassword(mail);
                        }

                      },
                      Text: "SEND",

                    );
                })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
