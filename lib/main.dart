import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_e_commerce/logic/controller/get_storage_controller.dart';
import 'package:my_e_commerce/routes/routes.dart';
import 'package:my_e_commerce/view/screens/welcome_screen.dart';

import 'utils/theme.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await GetStorage.init();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

// void main() {
//   runApp( MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      title: 'Bisho Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: MyStorageController().actualTheme,
      home: Welcome_Screen(),
      initialRoute: Routes.welcomeScreen,
      getPages: AppRoutes.routes,

      );

  }
}
