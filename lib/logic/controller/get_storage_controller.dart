import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyStorageController {

  final key = "isDark";

  final GetStorage myStorage = GetStorage();


   SaveThemeData(bool isDark) {
    myStorage.write(key, isDark);

  }
 bool GetThemeData() {

   return myStorage.read(key)?? false;

  }
  ThemeMode get actualTheme =>GetThemeData() ?  ThemeMode.dark :ThemeMode.light ;

  void ChangeTheme() {
    Get.changeThemeMode(
        GetThemeData() ? ThemeMode.light : ThemeMode.dark);

    SaveThemeData(!GetThemeData());

  }

}