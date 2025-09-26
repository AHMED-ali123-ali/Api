import 'package:dio/dio.dart';

import '../Model/category_list.dart';


class abi {
  Dio dio = Dio();
  Future<List<ProductCard>> getNow() async {
    var response = await dio.get('https://api.escuelajs.co/api/v1/products');
    var jason =  response.data;
    List<ProductCard> Product  = [];
    for(var item in jason){

    Product.add(
        ProductCard(
          id: item['id'],
          title: item['title'],
          slug: item['slug'],
          price: (item['price'] as num).toDouble(), // التحويل
          image: (item['images'] != null && item['images'].isNotEmpty) ? item['images'][0] : '',
        )
    );}
    return Product;

  }
}