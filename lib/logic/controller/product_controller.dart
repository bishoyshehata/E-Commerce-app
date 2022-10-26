import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:my_e_commerce/models/product_model.dart';
import 'package:my_e_commerce/services/product_service.dart';

class Product_Controller extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  var FavList = <ProductModel>[].obs;
  final GetStorage storage = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readStorage();
    getProduct();
  }

  getProduct() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }

  manageFav(int productId) async {
    int currentIndex = FavList.indexWhere((element) => element.id == productId);

    print("============");
    print(currentIndex);
    print(storage.read("MyFavList"));

    print("============");

    if (currentIndex >= 0) {
      FavList.removeAt(currentIndex);
      await storage.remove("MyFavList");
    } else {
      FavList.add(productList.firstWhere((element) => element.id == productId));
    }
    await storage.write("MyFavList", FavList);
  }

  bool checkIsFav(int productId) {
    return FavList.any((element) => element.id == productId);
  }

  void readStorage() {
    List? result = storage.read<List>('MyFavList');

    if (result != null) {
      FavList = result.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
  }
}
