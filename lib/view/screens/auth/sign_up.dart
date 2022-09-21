import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/auth_controller.dart';
import 'package:my_e_commerce/main.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/utils/my_string.dart';
import 'package:my_e_commerce/view/widgets/auth/auth_text_form_field.dart';
import 'package:my_e_commerce/view/widgets/auth/check_widgit.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/footer_container.dart';

class SignUp_Screen extends StatelessWidget {
  SignUp_Screen({Key? key}) : super(key: key);
  final _formkey=GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final controler = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            backgroundColor:Get.isDarkMode? darkGreyClr : Colors.white,
            appBar: AppBar(
              backgroundColor: Get.isDarkMode? darkGreyClr : Colors.white,
              elevation: 0,
            ),
            body:SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Padding(padding:  EdgeInsets.only(left: 25, right: 25 , top: 40),

                        child: Column(
                          children: [
                            Row(
                              children:  [
                                Text_Utils(fontWeight: FontWeight.w500, text: "SIGN", color: Get.isDarkMode? pinkClr :mainColor, isUndeLine:false, fontsize: 28)
                               ,SizedBox(width: 3,)
                                ,Text_Utils(fontWeight: FontWeight.w500, text: "UP", color:Get.isDarkMode? Colors.white :Colors.black, isUndeLine:false, fontsize: 28)

                              ],
                            ),
                            SizedBox(height: 50,),
                            Auth_TextFormField(controller: nameController,
                              obsecureText: false,
                              validator: (value){

                              if(value.toString().length<=2 || !RegExp(validationName).hasMatch(value)){
                                return "Invalid name" ;
                              }    else
                                      {
                                        return null ;
                                      }

                              },

                              prefex: Icon(Icons.person,size: 30,color:Get.isDarkMode? Colors.pink: mainColor,),
                              suffix: Text(""),
                              hintText: "Name",
                            ),
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
                                prefex: Icon(Icons.mail,size: 30,color: Get.isDarkMode?pinkClr: mainColor),
                              suffix: Text(""),
                              hintText: "E-Mail",
                            ),
                            SizedBox(height: 30,),

                            GetBuilder<AuthController>(builder: (_){
                              return Auth_TextFormField(controller: passController,
                                obsecureText: controler.isvisible?false : true,
                                validator: (value){
                                  if(value.toString().length<=6){
                                    return "Your password is too short" ;
                                  }else if(value.toString().length==0){
                                    return "invalid pass" ;
                                  }
                                },
                                prefex: Icon(Icons.lock,size: 30,color:Get.isDarkMode? pinkClr : mainColor,),
                                suffix: GestureDetector(
                                    onTap: (){
                                      controler.visibility();
                                    },
                                    child: controler.isvisible? Icon(
                                      Icons.visibility,
                                      color: Get.isDarkMode? pinkClr : mainColor,
                                    ):Icon(Icons.visibility_off,color: Get.isDarkMode? pinkClr : mainColor)

                                ),
                                hintText:"Password",
                              );
                            }
                            ),

                            SizedBox(height: 50,),
                            CheckWidget(),
                            SizedBox(height: 20,)
                            ,GetBuilder<AuthController>(builder: (_){
                              return  AuthButton(onpress: (){
                                if(controler.ismarked==false){
                                  Get.snackbar(
                                    "Check Box",
                                    "make sure accept terms & conditions",
                                    snackPosition:SnackPosition.BOTTOM ,
                                    colorText: Colors.white,
                                    backgroundColor: Colors.blue,
                                  );

                                }else if(_formkey.currentState!.validate()){
                                  String name = nameController.text.trim();
                                  String email = mailController.text.trim();

                                  controler.signUpUsingFireBase(
                                      name: name,
                                      email:email ,
                                      password: passController.text);
                                }


                              },
                                Text: "SIGN UP",);
                            })
                            ],
                          ),
                        ),
            ),
                    FooterContainer(
                      navigate: (){
                        Get.toNamed(Routes.loginScreen );
                      },
                      text1: "Already have an Account? ",
                      text2: "Log in",
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}
