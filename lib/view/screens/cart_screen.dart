import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/screens/cart/cart_builder.dart';
import 'package:my_e_commerce/view/screens/cart/cart_total.dart';
import 'package:my_e_commerce/view/widgets/auth/auth_button.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        title: Center(
          child: Text_Utils(
              fontWeight: FontWeight.bold,
              text: 'Cart Items',
              color: Get.isDarkMode ? pinkClr : Colors.white,
              isUndeLine: false,
              fontsize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.backspace,
                color: Colors.white,
              ))
        ],
      ),
      bottomSheet: TotalCart(),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return CartBuilder();
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 10),
    ));
  }
}
