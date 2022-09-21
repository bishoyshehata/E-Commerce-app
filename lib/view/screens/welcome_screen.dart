import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/button_utils.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.1),
            width: double.infinity,
            height: MediaQuery.of(context).size.height ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black38,
                    ),
                    child: const Center(
                      child: Text_Utils(
                          color: Colors.white,
                          text: 'Welcome',
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          isUndeLine: false),
                    )),
                SizedBox(height: 8,),
                Container(
                    width: 270,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black38,
                    ),
                    child: Row(
                      children:  [
                        Text_Utils(
                          fontWeight: FontWeight.bold,
                          text: 'Bisho',
                          color: Get.isDarkMode?pinkClr :mainColor,
                          fontsize: 40,
                          isUndeLine: false,
                        ),
                        SizedBox(
                          width: 7,
                        ),


                        Text_Utils(
                          fontWeight: FontWeight.bold,
                          text: 'Shop',
                          color: Colors.white,
                          fontsize: 40,
                          isUndeLine: false,
                        )
                      ],
                    )),
                Padding(
                  padding:  EdgeInsets.only(top:150),
                  child: Button_Utils(
                    color:Get.isDarkMode? pinkClr:mainColor ,
                    onpressed: () {
                      Get.offAllNamed(Routes.loginScreen);
                    },
                    elevation: 5,
                    textStyle: const Text_Utils(
                        fontWeight: FontWeight.normal,
                        text: 'Get Start',
                        color: Colors.white,
                        fontsize: 25,
                        isUndeLine: false),
                    textColor: Colors.white,
                    textSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text_Utils(
                        fontWeight: FontWeight.normal,
                        text: "Don't have an account?",
                        color: Colors.white,
                        fontsize: 18,
                        isUndeLine: false),
                    TextButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.signupScreen);
                        },
                        child: const Text_Utils(
                            fontWeight: FontWeight.normal,
                            text: "Sign Up",
                            color: Colors.white,
                            fontsize: 18,
                            isUndeLine: true))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
