import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../theme/theme.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/footer_container.dart';

class Login_Screen extends StatelessWidget {
   Login_Screen({Key ? key}) : super(key: key);
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
                        child: Padding(padding:  EdgeInsets.only(left: 25, right: 25 ,top: 40),

                          child: Column(
                            children: [
                              Row(
                                children:  [
                                  Text_Utils(fontWeight: FontWeight.w500, text: "LOG", color: Get.isDarkMode? pinkClr :mainColor, isUndeLine:false, fontsize: 28)
                                  ,SizedBox(width: 3,)
                                  ,Text_Utils(fontWeight: FontWeight.w500, text: "IN", color:Get.isDarkMode? Colors.white :Colors.black, isUndeLine:false, fontsize: 28)

                                ],
                              ),
                              SizedBox(height: 50,),
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
                                prefex: Icon(Icons.mail,size: 30,color: Get.isDarkMode?pinkClr:mainColor),
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
                                    }else {
                                      return null ;
                                    }
                                  },
                                  prefex: Icon(Icons.lock,size: 30,color:Get.isDarkMode? pinkClr :mainColor,),
                                  suffix: GestureDetector(
                                      onTap: (){
                                        controler.visibility();
                                      },
                                      child: controler.isvisible? Icon(
                                        Icons.visibility,
                                        color: Get.isDarkMode? pinkClr :mainColor,
                                      ):Icon(Icons.visibility_off,color: Get.isDarkMode? pinkClr :mainColor)

                                  ),
                                  hintText:"Password",
                                );
                              }
                              ),
                              InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.forgetpasswordScreen);
                                },
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text_Utils(fontWeight: FontWeight.normal,
                                      text: "Forget Password?",
                                      color: Get.isDarkMode ? Colors.white : Colors.black,
                                      isUndeLine: false,
                                      fontsize:23),
                                ),
                              ),

                              SizedBox(height: 50,),

                              GetBuilder<AuthController>(builder: (_){
                                return AuthButton(onpress: (){

                                  if(_formkey.currentState!.validate()){
                                    String mail = mailController.text.trim();
                                    controler.logInUsingFireBase(email: mail, password: passController.text);

                                  }

                                },
                                  Text: "LOG IN",);
                              }),
                              SizedBox(height: 20,),

                              Text_Utils(fontWeight: FontWeight.normal,
                                  text: "OR",
                                  color: Get.isDarkMode ? Colors.black : Colors.white,
                                  isUndeLine: false,
                                  fontsize:23),
                              SizedBox(height: 5,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<AuthController>(builder: (_){
                                    return InkWell(
                                        onTap:(){
                                          controler.facebookLogInRegistration();
                                        },
                                        child: Image.asset("images/facebook.png"));
                                  }),
                                  SizedBox(width: 30,),
                                  GetBuilder<AuthController>(builder: (_){
                                    return InkWell(
                                        onTap:(){
                                        controler.googleSignUpApp();
                                        },
                                        child: Image.asset("images/google.png"));
                                  })

                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                      FooterContainer(
                        navigate: (){
                          Get.toNamed(Routes.signupScreen);
                        },
                        text2:"Sign up" ,
                        text1: "Don't have an Account? ",)
                    ],
                  ),
                ),
              )
          )
      );

  }
}
