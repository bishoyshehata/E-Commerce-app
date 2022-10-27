import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

import '../../../utils/theme.dart';

class CartBuilder extends StatelessWidget {
  const CartBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        GetBuilder(builder: (_) {
                          return Text(
                            "5",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          );
                        }),
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
}
