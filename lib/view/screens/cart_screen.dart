import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/theme/theme.dart';
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

  Widget CartBuilder() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          child: Row(
            children: [
              Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      "https://i.pinimg.com/originals/83/0a/db/830adb8498e4109966093d0df71473c6.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "titletitletitletitletitletitletitletitletitletitletitle",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text_Utils(
                        fontWeight: FontWeight.normal,
                        text:
                            "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        isUndeLine: false,
                        fontsize: 14),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_circle_outlined,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "5",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle_rounded,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Get.isDarkMode ? Colors.black : Colors.red,
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget EmptyCartScreen() {
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
