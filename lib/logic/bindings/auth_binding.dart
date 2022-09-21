
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(AuthController());

  }


}