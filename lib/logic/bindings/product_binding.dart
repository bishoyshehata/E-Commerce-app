import 'package:get/get.dart';
import 'package:my_e_commerce/logic/controller/main_controllerr.dart';
import 'package:my_e_commerce/logic/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(Product_Controller(), permanent: true);
  }
}
