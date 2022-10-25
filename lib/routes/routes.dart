import 'package:get/get.dart';
import 'package:my_e_commerce/logic/bindings/product_binding.dart';
import 'package:my_e_commerce/view/screens/auth/forget_password.dart';
import 'package:my_e_commerce/view/screens/auth/login.dart';
import 'package:my_e_commerce/view/screens/auth/sign_up.dart';
import 'package:my_e_commerce/view/screens/layout/main_screen.dart';
import 'package:my_e_commerce/view/screens/welcome_screen.dart';

import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/main_binding.dart';

class AppRoutes {
  static const welcomeScreen = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const Welcome_Screen()),
    GetPage(
      name: Routes.loginScreen,
      page: () => Login_Screen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignUp_Screen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetpasswordScreen,
      page: () => Forget_Password(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.mainScreen,
        page: () => Main_Screen(),
        bindings: [MainBinding(), AuthBinding(),ProductBinding()]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetpasswordScreen = '/forgetpasswordScreen';
  static const mainScreen = '/mainScreen';
}
