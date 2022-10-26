import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/product_controller.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

class Favorite_Screen extends StatelessWidget {
  Favorite_Screen({Key? key}) : super(key: key);
  final controller = Get.put(Product_Controller());

  BuildContext get context => context;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.FavList.isNotEmpty) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return FavouriteList(
                  productId: controller.FavList[index].id,
                  title: controller.FavList[index].title,
                  price: controller.FavList[index].price,
                  image: controller.FavList[index].image);
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Get.isDarkMode ? pinkClr : mainColor,
                thickness: 1,
              );
            },
            itemCount: controller.FavList.length);
      } else {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                width: 150,
                child: Image.asset("images/heart.png")),
            SizedBox(
              height: 15,
            ),
            Text_Utils(
                fontWeight: FontWeight.bold,
                text: 'Please, add your favourite products',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                isUndeLine: false,
                fontsize: 18)
          ],
        ));
      }
    });
    //
  }

  Widget FavouriteList(
      {required image, required price, required title, required productId}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Row(
          children: [
            Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text_Utils(
                      fontWeight: FontWeight.normal,
                      text: "$price",
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      isUndeLine: false,
                      fontsize: 14),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFav(productId);
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
