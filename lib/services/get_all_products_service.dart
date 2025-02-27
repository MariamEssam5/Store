import 'dart:convert';

import 'package:http/http.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:http/http.dart' as http;

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
