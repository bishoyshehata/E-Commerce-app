import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../../utils/theme.dart';

class TotalCart extends StatelessWidget {
  const TotalCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode ? Colors.black : Colors.white,
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text_Utils(
                  fontWeight: FontWeight.bold,
                  text: 'Total',
                  color: Colors.grey,
                  isUndeLine: false,
                  fontsize: 16),
              SizedBox(
                height: 10,
              ),
              Text_Utils(
                  fontWeight: FontWeight.bold,
                  text: '\$680.22',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  isUndeLine: false,
                  fontsize: 20),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
              child: SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text_Utils(
                      color: Colors.white,
                      fontsize: 25,
                      fontWeight: FontWeight.bold,
                      isUndeLine: false,
                      text: "Check Out",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_rounded)
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                )),
          )),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
