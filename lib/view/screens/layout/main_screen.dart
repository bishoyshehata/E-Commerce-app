import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/main_controllerr.dart';
import '../../../theme/theme.dart';
import '../../widgets/text_utils.dart';

class Main_Screen extends StatelessWidget {
   Main_Screen({Key? key}) : super(key: key);

    final Controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx((){
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Get.isDarkMode? darkGreyClr : mainColor,
              actions: [IconButton(icon: Icon(Icons.shopping_bag,color: Get.isDarkMode? pinkClr : Colors.white),
                    onPressed: () {

                    })],
              title: Center(
                child: Text_Utils(
                    fontWeight: FontWeight.bold,
                    text:
                    Controller.Title[Controller.currentIndex.value],
                    color: Get.isDarkMode? pinkClr : Colors.white,
                    isUndeLine: false,
                    fontsize: 27),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home
                    ,color: Get.isDarkMode?Colors.white : Colors.black  ,
                  ),
                  label: '',
                  activeIcon:Icon(Icons.home,color:Get.isDarkMode? pinkClr : mainColor ,),


                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category
                    ,color: Get.isDarkMode?Colors.white : Colors.black  ,
                  ),
                  label: '',
                  activeIcon:Icon(Icons.category,color:Get.isDarkMode? pinkClr : mainColor ,),


                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite
                    ,color: Get.isDarkMode?Colors.white : Colors.black  ,
                  ),
                  label: '',
                  activeIcon:Icon(Icons.favorite,color:Get.isDarkMode? pinkClr : mainColor ,),


                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings
                    ,color: Get.isDarkMode?Colors.white : Colors.black  ,
                  ),
                  label: '',
                  activeIcon:Icon(Icons.settings,color:Get.isDarkMode? pinkClr : mainColor ,),


                ),
              ],
              currentIndex: Controller.currentIndex.value,
              onTap: (index){
          Controller.currentIndex.value = index;
              },

            )
            ,
            body: IndexedStack(
              index: Controller.currentIndex.value,
              children: Controller.tabs,

            )
          );
        })
    );
  }
}
