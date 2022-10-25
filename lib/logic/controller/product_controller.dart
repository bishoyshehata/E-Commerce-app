import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:my_e_commerce/models/product_model.dart';
import 'package:my_e_commerce/services/product_service.dart';

class Product_Controller extends GetxController{

  var isLoading = true.obs ;
  var productList = <ProductModel>[].obs;
  var FavList = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }



   getProduct()async{
    var products = await ProductServices.getProduct();

    try{
      isLoading(true);
      if(products.isNotEmpty){
        productList.addAll(products);

      }
    }finally{
      isLoading.value=false ;

    }
   }
    
   
   manageFav(int productId){
      FavList.add(productList.firstWhere((element) => element.id==productId ));
   }
  bool checkIsFav(int productId){
    return FavList.any((element) => element.id==productId );

   }



}