

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/view/screens/category_screen.dart';
import 'package:my_e_commerce/view/screens/favorite_screen.dart';
import 'package:my_e_commerce/view/screens/home_screen.dart';
import 'package:my_e_commerce/view/screens/setting_screen.dart';

import '../../theme/theme.dart';
import '../../view/widgets/text_utils.dart';

class MainController extends GetxController{

 RxInt currentIndex = 0.obs ;


 final tabs = [
  Home_Screen(),
  Category_Screen(),
  Favorite_Screen(),
  Setting_Screen()
 ].obs;


 final Title = [
  "Bisho Shop",
  "Categories",
  "Favorites",
  "Setting"
 ].obs;


}