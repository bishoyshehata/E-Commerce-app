import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/auth_controller.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../logic/controller/get_storage_controller.dart';

class Setting_Screen extends StatelessWidget {
   Setting_Screen({Key? key}) : super(key: key);

  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              MyStorageController().ChangeTheme();
            },
            child: Center(
              child: Text_Utils(
                  fontWeight: FontWeight.normal,
                  text: "Dark Mode",
                  color: Get.isDarkMode ? Colors.white:darkGreyClr,
                  isUndeLine: false,
                  fontsize: 30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return
              TextButton(
                onPressed: () {
                        Controller.logOutFromApp();
                },
              child: Center(
                child: Text_Utils(
                    fontWeight: FontWeight.normal,
                    text: "Log Out",
                    color: Get.isDarkMode ? Colors.white:darkGreyClr,
                    isUndeLine: false,
                    fontsize: 30),
              ),
            );
          })
        ],
      )
    );
  }
}
