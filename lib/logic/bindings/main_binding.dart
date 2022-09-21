
import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/main_controllerr.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

      Get.put(MainController());

  }

}