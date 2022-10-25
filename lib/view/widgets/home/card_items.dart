import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/product_controller.dart';
import 'package:my_e_commerce/main.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

class Card_Items extends StatelessWidget {
   Card_Items({Key? key}) : super(key: key);
  final productController = Get.find<Product_Controller>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(productController.isLoading.value){
        return  Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr:mainColor,

          ),
        );
      }
      else{
        return Expanded(
          child: GridView.builder(
              itemCount: productController.productList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0),
              itemBuilder: (contex, index) {
                return buildCardItems(
                    image:productController.productList[index].image ,
                    price: productController.productList[index].price,
                    rating: productController.productList[index].rating.rate,
                    productId: productController.productList[index].id
                );
              }),
        );
      }
    });
  }

  Widget buildCardItems({
      required  image ,
      required  price,
      required  rating,
    required  productId,

  }) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
          BoxShadow(
              color:Colors.grey.withOpacity(.3),
              spreadRadius: 3,
              blurRadius: 5),
        ]),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Obx((){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        IconButton(
                            onPressed: () {
                              productController.manageFav(productId);
                            },
                            icon: productController.checkIsFav(productId)
                                ?  Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    )
              ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add,
                            color: Colors.black))
                  ],
                );

            }),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 140,
              width: double.infinity,
              child: Image.network(
               image,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text_Utils(
                        fontWeight: FontWeight.bold,
                        text: "\$ $price",
                        color: Colors.black,
                        isUndeLine: false,
                        fontsize: 14),
                  ),
                  Stack(
                  alignment: Alignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Row(

                        children: [
                          Text_Utils(
                              fontWeight: FontWeight.bold,
                              text: "$rating",
                              color:  Colors.white,
                              isUndeLine: false,
                              fontsize: 12),
                          SizedBox(width: 5,),
                          Icon(Icons.star,size: 15, color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // Stack(
            //   children: [
            //
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
