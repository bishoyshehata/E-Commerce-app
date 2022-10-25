import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/home/card_items.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../widgets/search_text_field.dart';

class Home_Screen extends StatelessWidget {
   Home_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: const Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text_Utils(
                        fontWeight: FontWeight.normal,
                        text: "Find Your",
                        color: Colors.white,
                        isUndeLine: false,
                        fontsize: 30),
                    Text_Utils(
                        fontWeight: FontWeight.bold,
                        text: "Inspiration",
                        color: Get.isDarkMode ? darkGreyClr : Colors.white,
                        isUndeLine: false,
                        fontsize: 30),
                    const SizedBox(
                      height: 20,
                    ),
                    const SearchField(),
                  ],
                ),
              ),
            ),
            Padding(
                child: Text_Utils(
                    fontWeight: FontWeight.normal,
                    text: "Categories",
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    isUndeLine: false,
                    fontsize: 20),

                padding: const EdgeInsets.only(top: 10, left: 20)),

            const SizedBox(height: 20,),
            Card_Items()

          ],
        ),
      ),
    );
  }
}
