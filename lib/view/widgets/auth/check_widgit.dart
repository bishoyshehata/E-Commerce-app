
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../../logic/controller/auth_controller.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

  final controler = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthController>(builder: (_){
        return InkWell(
            onTap: (){
              controler.marked();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child:controler.ismarked? Get.isDarkMode ?Image.asset("images/check.png"):Icon(Icons.done,size: 35,color: pinkClr,)
                  : Text("") ,
            ),
          );
        }),
       SizedBox(width: 10,),
        Text_Utils(
            fontWeight: FontWeight.normal,
            text: "I accept ",
            color: Get.isDarkMode ?Colors.white : Colors.black,
            isUndeLine: false,
            fontsize: 20),
        InkWell(
          onTap: (){},
          child: Text_Utils(
              fontWeight: FontWeight.normal,
              text: "terms & conditions",
              color: Get.isDarkMode ?Colors.white : Colors.black,
              isUndeLine: true,
              fontsize: 20),
        )
      ],
    );
  }
}
