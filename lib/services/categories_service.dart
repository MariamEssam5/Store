import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getAllCategoriesProduct(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
