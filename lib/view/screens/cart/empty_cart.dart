import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../../routes/routes.dart';
import '../../../theme/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_rounded,
            color: Get.isDarkMode ? pinkClr : Colors.black,
            size: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text_Utils(
                  fontWeight: FontWeight.bold,
                  text: 'Your Cart Is ',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  isUndeLine: false,
                  fontsize: 28),
              const SizedBox(
                width: 5,
              ),
              Text_Utils(
                  fontWeight: FontWeight.bold,
                  text: 'Empty',
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  isUndeLine: false,
                  fontsize: 28),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text_Utils(
              fontWeight: FontWeight.bold,
              text: 'Add items to get started',
              color: Get.isDarkMode ? Colors.white : Colors.black,
              isUndeLine: false,
              fontsize: 15),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.mainScreen);
                },
                child: const Text_Utils(
                  color: Colors.white,
                  fontsize: 25,
                  fontWeight: FontWeight.bold,
                  isUndeLine: false,
                  text: "Go To Home",
                ),
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                )),
          )
        ],
      ),
    );
  }
}
