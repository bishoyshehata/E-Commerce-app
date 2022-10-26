import 'package:http/http.dart' as http;
import 'package:my_e_commerce/utils/my_string.dart';

import '../models/product_model.dart';

class ProductServices {
  static Future<List<ProductModel>> getProduct() async {
    var response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load products");
    }
  }

  static Future<List<ProductModel>> showProduct(productId) async {
    var response = await http.post(Uri.parse("$baseUrl/product/show"),
        body: {"product_id": productId});

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load products : $response.statusCode ");
    }
  }
}
